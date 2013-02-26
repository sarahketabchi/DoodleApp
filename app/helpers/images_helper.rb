module ImagesHelper
  def favorited?(user_id, image_id)
    if Favorite.where(:user_id => user_id, :image_id => image_id).length > 0
      return true
    else
      return false
    end
  end
end
