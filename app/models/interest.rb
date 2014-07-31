class Interest < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  accepts_nested_attributes_for :tag
  validates_uniqueness_of :user_id, scope: :tag_id, message: "You can't select the same interest twice"

  def tag_attributes=(tag_attributes)
    tag = Tag.find_or_create_by(name: tag_attributes[:name].downcase)
    self.tag_id = tag.id
  end

end
