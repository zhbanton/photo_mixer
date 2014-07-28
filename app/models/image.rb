class Image < ActiveRecord::Base
  mount_uploader :url, ImageUploader

  include Votable
  belongs_to :user
  has_many :comments
  validates :url, presence: true
end
