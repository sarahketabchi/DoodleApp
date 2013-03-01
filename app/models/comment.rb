class Comment < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :image
  belongs_to :user
end
