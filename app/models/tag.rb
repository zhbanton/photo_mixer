class Tag < ActiveRecord::Base
  has_many :interests, dependent: :destroy
  has_many :users, through: :interests
  validates :name, presence: true, uniqueness: true
end
