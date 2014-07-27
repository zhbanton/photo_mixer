class Comment < ActiveRecord::Base
  include Votable
  belongs_to :user
  belongs_to :image
  validates :body, presence: true
end
