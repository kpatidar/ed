class AlbumsController < ApplicationController
  before_filter :require_user
  layout :set_layout

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
      end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = current_user.albums.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = current_user.albums.build(params[:album])
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = current_user.albums.find(params[:id])
    if @album 
	respond_to do |format|
	  if @album.update_attributes(params[:album])
	    format.html { redirect_to @album, notice: 'Album was successfully updated.' }
	  else
	    format.html { render action: "edit" }
	  end
	end
    else

    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    respond_to do |format|
      format.html { redirect_to my_albums_albums_url }
    end
  end

  def my_albums
    @albums = Album.find(:all,:conditions=>[" user_id = ? " , current_user.id] )
    render :template => 'albums/index'
  end
  def all_albums
    #@albums = Album.find(:all,:conditions=>[" user_id = ? " , current_user.id] )
    #@albums = current_user.albums
    @albums = Album.all
    render :template => 'albums/all_albums'
  end
end
