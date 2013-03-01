class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    # @comment = Comment.new
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build
  end

  def create
    @comment = Comment.create!(params[:comment])

    if @comment
      redirect_to image_path(@comment.image_id)
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    imageId = @comment.image_id
    @comment.destroy

    redirect_to image_path(imageId) 
  end
end
