class Image < ActiveRecord::Base
  mount_uploader :image_path, ImageUploader

  include Votable
  belongs_to :user
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favorited, :through => :favorite_images, :source => :user
end
