class Category < ActiveRecord::Base

  has_many :tags, dependent: :destroy
  has_many :images, through: :tags
  has_many :interests, dependent: :destroy
  has_many :users, through: :interests

end
