class Image < ActiveRecord::Base
  mount_uploader :image_path, ImageUploader

  include Votable
  belongs_to :user
  has_many :comments
end
