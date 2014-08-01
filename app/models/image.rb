require 'file_size_validator'
class Image < ActiveRecord::Base
  mount_uploader :image_path, ImageUploader

  validates :image_path, presence: true, :file_size => { :maximum => 5.0.megabytes.to_i }
  validates :user_id, presence: true

  include Votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags

  def self.tagged_with(name)
    Category.find_by(name: name).images
  end

  def self.tag_counts
    Tag.select("categories.*, count(tags.category_id) as count")
      joins(:tags).group("tags.category_id")
  end

  def tag_list
    categories.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.categories = names.split(",").map do |n|
      Category.where(name: n.strip).first_or_create!
    end
  end

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


