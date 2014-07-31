require 'file_size_validator'
class Image < ActiveRecord::Base
  mount_uploader :image_path, ImageUploader
  acts_as_ordered_taggable

  validates :image_path, presence: true, :file_size => { :maximum => 5.0.megabytes.to_i }
  validates :user_id, presence: true

  include Votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.filterize(filter)
    case filter
    when 'today'
      Image.where('created_at > ?', 24.hours.ago).order(score: :desc)
    when 'this_week'
      Image.where('created_at > ?', 1.week.ago).order(score: :desc)
    when 'all_time'
      Image.all.order(score: :desc)
    when 'most_recent'
      Image.all.order(created_at: :desc)
    end
  end

end


