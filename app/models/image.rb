require 'file_size_validator'
class Image < ActiveRecord::Base
  mount_uploader :image_path, ImageUploader
  acts_as_ordered_taggable

  validates :image_path, presence: true, :file_size => { :maximum => 5.0.megabytes.to_i }
  validates :user_id, presence: true

  include Votable
  belongs_to :user
  has_many :comments
  has_many :favorites
end


# where tag name like input
# form_tag in nav bar
