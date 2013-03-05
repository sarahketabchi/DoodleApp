class FriendsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @friendship = Friendship.create!(:user_id => current_user.id, :friend_id => params[:user_id], :status => "requested")
    @friendship_inverse = Friendship.create!(:user_id => params[:user_id], :friend_id => current_user.id, :status => "pending")
    render :nothing => true
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    #delete inverse friendship
    Friendship.where(:user_id => @friendship.friend_id, :friend_id => @friendship.user_id, :status => "requested").first.destroy
    @friendship.destroy

    redirect_to user_path(current_user)
  end
end

