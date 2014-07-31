class Interest < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :category
  validates_uniqueness_of :user_id, scope: :category_id, message: "You can't select the same interest twice"

  def category_attributes=(category_attributes)
    category = Category.find_or_create_by(name: category_attributes[:name].downcase)
    self.category_id = category.id
  end

end
