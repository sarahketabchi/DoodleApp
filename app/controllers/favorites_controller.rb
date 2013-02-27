class FavoritesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @user = current_user
    @favorite = Favorite.create!(:user_id => @user.id, :image_id => params[:image_id])
    
    render :nothing => true
  end

  def destroy
    @user = current_user
    Favorite.where(:user_id => @user.id, :image_id => params[:image_id]).first.destroy

    render :nothing => true
  end
end
