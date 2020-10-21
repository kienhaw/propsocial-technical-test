class Notification < ApplicationRecord
  belongs_to :inquiry
  belongs_to :source, polymorphic: true
end
