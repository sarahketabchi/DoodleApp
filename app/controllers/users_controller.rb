class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images
    @favorited_images = @user.favorited_images
    @contributed_images = @user.contributed_images.uniq {|img| img.id} 
  end
end
