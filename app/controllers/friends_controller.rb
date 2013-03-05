class FriendsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @friendship = Friendship.create!(:user_id => current_user.id, :friend_id => params[:user_id], :status => "requested")
    @friendship_inverse = Friendship.create!(:user_id => params[:user_id], :friend_id => current_user.id, :status => "pending")
    render :nothing => true
  end

  def destroy
    
  end
end

