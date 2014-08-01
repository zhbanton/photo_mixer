require 'file_size_validator'
class User < ActiveRecord::Base

  attr_accessor :login
  # Use Carrierwave to allow User to upload avatar associated with their account
  mount_uploader :avatar, AvatarUploader

  has_many :uploaded_images, foreign_key: 'user_id', class_name: "Image", dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :categories, through: :interests
  has_many :votes
  accepts_nested_attributes_for :interests, reject_if: proc { |attributes| attributes['category_attributes']['name'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :categories

  validates :username, presence: true
  validates :username, uniqueness: true, case_sensitive: false
  validates :email, presence: true
  validates :email, uniqueness: true, case_sensitive: false
  validates :avatar, :file_size => { :maximum => 3.0.megabytes.to_i }
  validates_length_of :blurb, maximum: 150, message: "Limit yourself to 150 characters, please!"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

  def favorite_images
    favorites.map { |favorite| favorite.image }
  end

  def get_favorite(image)
    favorites.select { |favorite| favorite.image_id == image.id }.first
  end

  def images_of_interest
    categories.map { |cat| cat.images }
  end

end
