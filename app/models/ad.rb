class Ad < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_many :images, as: :source
end
