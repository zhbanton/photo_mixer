class Tag < ActiveRecord::Base
  has_many :interests
  has_many :users, through: :interests
end
