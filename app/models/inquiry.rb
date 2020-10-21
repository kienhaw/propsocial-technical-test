class Inquiry < ApplicationRecord
  belongs_to :ad
  belongs_to :source, polymorphic: true
end
