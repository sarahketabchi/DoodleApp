class FavoritesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @user = current_user
    @image = Image.find(params[:image_id])

    @favorite = Favorite.create!(:user_id => @user.id, :image_id => @image.id)
    render :nothing => true
  end

  def destroy
    @user = current_user
    @image = Image.find(params[:image_id])

    Favorite.where(:user_id => @user.id, :image_id => @image.id).first.destroy

    render :nothing => true
  end
end
