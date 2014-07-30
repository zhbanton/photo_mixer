class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  validates_uniqueness_of :user_id, scope: :image_id, message: "You can't like the same image twice- SORRY!"
end
