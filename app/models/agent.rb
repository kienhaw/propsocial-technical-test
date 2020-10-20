class Agent < ApplicationRecord
  has_secure_password
  validates :phone_number, uniqueness: true
  validates :nric, uniqueness: true
  validates :email, uniqueness: true
  validates :ren_no, uniqueness: true
  mount_uploader :ic_image, ImageUploader
  mount_uploader :agent_id_image, ImageUploader
end
