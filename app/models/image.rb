class Image < ActiveRecord::Base
  mount_uploader :image_path, ImageUploader
  validates :url, presence: true
  validates :user_id, presence: true

  include Votable
  belongs_to :user
  has_many :comments
  has_many :favorites
end
