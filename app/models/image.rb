class Image < ApplicationRecord
  belongs_to :source, polymorphic: true
  mount_uploader :name, ImageUploader
end
