class User < ApplicationRecord
  has_secure_password
  validates :phone_number, uniqueness: true
  validates :nric, uniqueness: true
  validates :email, uniqueness: true
  mount_uploader :ic_image, ImageUploader
end
