class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body


  has_many :images
  has_many :favorites
  has_many :favorited_images, :through => :favorites, :source => :image

  has_many :contributors
  has_many :contributed_images, :through => :contributors, :source => :image
end
