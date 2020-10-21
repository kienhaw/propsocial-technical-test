class Inquiry < ApplicationRecord
  belongs_to :ad
  belongs_to :source, polymorphic: true

  after_create do
    ad.source.notifications.create!(
      title: 'New inquiry',
      content: "#{source.first_name} #{source.last_name} has sent a new inquiry for #{ad.property_name}",
      inquiry: self
    )
  end
end
