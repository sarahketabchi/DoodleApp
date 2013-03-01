class Image < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :user

  has_many :contributors, :dependent => :destroy
  has_many :contributed_users, :through => :contributors, :source => :user

  has_many :comments, :dependent => :destroy
end
