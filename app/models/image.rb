class Image < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :user

  has_many :contributors, :dependent => :destroy
  has_many :contributed_users, :through => :contributors, :source => :user

  has_many :comments, :dependent => :destroy

  has_many :favorites

  def self.all_viewable_by(user)
    public_images = Image.where(:privacy => 'public').pluck(:id)

    users_images = Image.where(:user_id => user.id).pluck(:id)

    friends_friend_images = Image.joins("INNER JOIN friendships ON friendships.friend_id = images.user_id")
          .where("friendships.user_id = ?", user.id)
          .where("friendships.status = 'accepted'")
          .where("images.privacy = 'friends'")
          .pluck("images.id")

    image_ids = public_images + users_images + friends_friend_images
    image_ids.uniq!

    Image.find(image_ids)
  end

  def favorited?(user_id, image_id)
    if Favorite.where(:user_id => user_id, :image_id => image_id).length > 0
      return true
    else
      return false
    end
  end
end
