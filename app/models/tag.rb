class Tag < ActiveRecord::Base

  before_create :downcase_name

  has_many :interests, dependent: :destroy
  has_many :users, through: :interests
  validates :name, presence: true, uniqueness: true

  def downcase_name
    self.name = name.downcase
  end

end
