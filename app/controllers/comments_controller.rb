class CommentsController < ApplicationController
  before_filter :require_user
  layout :set_layout
  # POST /comments
  # POST /comments.json
  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(:comment_name => params[:comment_name])
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { render :partial => "photo_comment" }
      else
        format.html { render :text => "error" }
      end
    end
  end
end
