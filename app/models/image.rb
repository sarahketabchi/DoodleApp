class Image < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :user

  has_many :contributors, :dependent => :destroy
  has_many :contributed_users, :through => :contributors, :source => :user

  has_many :comments, :dependent => :destroy

  def favorited?(user_id, image_id)
    if Favorite.where(:user_id => user_id, :image_id => image_id).length > 0
      return true
    else
      return false
    end
  end
end
