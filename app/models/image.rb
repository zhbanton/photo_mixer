class Image < ActiveRecord::Base
  include Votable
  belongs_to :user
  has_many :comments
  validates :url, presence: true
end
