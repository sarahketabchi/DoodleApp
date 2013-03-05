module FriendsHelper
  def which_friend_btn(user)
    if current_user.id == user.id
      return "none"
    elsif current_user.friends.include?(user)
      return "friends"
    elsif current_user.requested_friends.include?(user)
      return "requested"
    elsif current_user.pending_friends.include?(user)
      return "pending"
    else
      return "add"
    end
  end
end
