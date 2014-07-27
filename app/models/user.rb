class User < ActiveRecord::Base
  has_many :uploaded_images, foreign_key: 'user_id', class_name: "Image"
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
