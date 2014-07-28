class User < ActiveRecord::Base

  attr_accessor :login
  # Use Carrierwave to allow User to upload avatar associated with their account
  mount_uploader :avatar, AvatarUploader

  has_many :uploaded_images, foreign_key: 'user_id', class_name: "Image"
  has_many :comments
  has_many :images
  has_many :favorites, :dependent => :destroy
  has_many :favorite_images, :through => :favorites, :source => :favorited

  validates :username, presence: true
  validates :username, uniqueness: true, case_sensitive: false
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

end
