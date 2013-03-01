class Comment < ActiveRecord::Base
  attr_accessible :image_id, :user_id, :body

  belongs_to :image
  belongs_to :user
end
