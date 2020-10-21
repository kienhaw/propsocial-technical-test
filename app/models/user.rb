class User < ApplicationRecord
  has_secure_password
  validates :phone_number, uniqueness: true
  validates :nric, uniqueness: true
  validates :email, uniqueness: true
  has_one :image, as: :source
  has_many :ads, as: :source
  has_many :notifications, as: :source
end
