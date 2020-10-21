class Agent < ApplicationRecord
  has_secure_password
  validates :phone_number, uniqueness: true
  validates :nric, uniqueness: true
  validates :email, uniqueness: true
  validates :ren_no, uniqueness: true
  has_many :images, as: :source
  has_many :ads, as: :source
  has_many :notifications, as: :source
  has_many :inquiries, as: :source

end
