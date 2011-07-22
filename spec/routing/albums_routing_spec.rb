require 'spec_helper'

describe MemoriesController do
  fixtures :users

  describe "GET #index" do
    it "should be successful if user is logged in" do
      sign_in_as users(:jameswildingdev)
      get 'index'
      response.should be_success #render_template("index")
    end
    it "should redirect to sign in page when user in not logged in" do
      get 'index'
      response.should redirect_to('/sign_in')
    end
    it "should redirect to sign in page when user sign_out" do
      sign_out
      get 'index'
      response.should redirect_to('/sign_in')
    end
  end

  describe "GET #new" do
    before(:each) do
      sign_in_as users(:jameswildingdev)
    end
    it "should render template new" do
      get 'new'
      response.should render_template("new")
    end
  end

  describe "POST #create" do
    before(:each) do
      sign_in_as users(:jameswildingdev)
    end
    it "should create memory and redirect to index page" do
      post :create, :memory => {:title =>"test memory", :content =>"Discription of memory", :user_id => users(:jameswildingdev).id, :happened_on => Date.today }
      assigns(:memory).should_not be_nil
      response.should redirect_to("/memories")
    end
    it "should not create memory and render the new template" do
      post 'create', :memory => {:title => '', :content =>"Discription of memory", :user_id => users(:jameswildingdev).id  }
      assigns(:memory).should_not be_nil
      response.should render_template("new")
    end
  end
  
  describe "GET #show" do
    before(:each) do
      sign_in_as users(:jameswildingdev)
      @memory = Memory.create(valid_attributes)
    end
    
    it "assigns the requested memory as @memory and render show template" do
      get :show, :id => @memory.id.to_s
      assigns(:memory).should_not be_nil
      response.should render_template('show')
    end
    
  end
  
  describe "GET #shared" do
    before(:each) do
      @memory = Memory.create(valid_attributes)
    end
  
    it "should assign requested memory as @memory and render show_shared template" do
      get :show_shared, :id => @memory.hashed_id.to_s
      assigns(:memory).should_not be_nil
      response.should render_template('show_shared')
    end
  end

  describe "GET #edit" do
    before(:each) do
      sign_in_as users(:jameswildingdev)
      @memory = Memory.create(valid_attributes)
    end
    
    it "assigns the requested memory as @memory and render edit template" do
      get :edit, :id => @memory.id.to_s
      assigns(:memory).should_not be_nil
      response.should render_template('edit')
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in_as users(:jameswildingdev)
      @memory = Memory.create(valid_attributes)
      @valid_attributes = valid_attributes
    end

    it "update the memory record and redirect to show" do
      @valid_attributes[:title] = 'new title'
      put :update, :id => @memory.id.to_s, :memory => @valid_attributes
      assigns(:memory).title.should eql('new title')
      response.should redirect_to(@memory)
    end

    it "should not update the memory record " do
      @valid_attributes[:title] = ''
      put :update, :id => @memory.id.to_s, :memory => @valid_attributes
      assigns(:memory).title.should eql('')
      assigns(:memory).errors_on(:title).should_not be_blank
      response.should render_template('edit')
    end
  end

  describe "GET #publics" do
    it "should be successful if user is without logged in" do
      get 'publics'
      assigns(:memories).should_not be_nil
      response.should render_template("publics")
    end
  end

  describe "POST #share_on_twitter" do
    before(:each) do
      sign_in_as users(:jameswildingdev)
      @memory = Memory.create(valid_attributes)
    end
    
    it "should post memory to twitter" do
      post "share_on_twitter", :id => @memory.id.to_s
      assigns(:result).should be_true
      response.should redirect_to(memories_url)
    end
  end

  describe "POST #share_on_facebook" do
    before(:each) do
      sign_in_as users(:jameswildingdev)
      @memory = Memory.create(valid_attributes)
    end
    
    it "should post memory to facebook" do
      post "share_on_facebook", :id => @memory.id.to_s
      assigns(:result).should be_true
      response.should redirect_to(memories_url)
    end
  end

  describe "POST #share_on_email" do
    before(:each) do
      sign_in_as users(:jameswildingdev)
      @memory = Memory.create(valid_attributes)
    end

    it "should email to user's contact list and redirect to index" do
      post :share_on_email, :id => @memory.id.to_s
      assigns(:result).should be_true
      response.should redirect_to(memories_url)
    end
  end

  def valid_attributes
    { :title => dynamic_memory_title, :content =>"Test memory content", :user_id => users(:jameswildingdev).id, :happened_on => Date.today, :tag_list => "Tag1, Tag2", :public => false }
  end

  def dynamic_memory_title
    "Test memory title" + rand(26).to_s
  end

end
