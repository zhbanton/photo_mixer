class Category < ActiveRecord::Base

  has_many :tags, dependent: :destroy
  has_many :images, through: :tags
  has_many :interests, dependent: :destroy
  has_many :users, through: :interests

  def self.tag_counts
    counts = {}
    Tag.all.each do |tag|
      if counts[tag.category.name]
        counts[tag.category.name] += 1
      else
        counts[tag.category.name] = 1
      end
    end
    counts
  end

  def count
    tag_count = 0
    Tag.all.each do |t|
      tag_count += 1 if t.category_id == self.id
    end
    tag_count
  end

end
