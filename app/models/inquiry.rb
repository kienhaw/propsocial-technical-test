class Inquiry < ApplicationRecord
  belongs_to :ad
  belongs_to :source, polymorphic: true

  after_create do
    source.notifications.create!(
      title: 'New inquiry',
      content: "#{source.first_name} #{source.last_name} has sent a new inquiry",
      inquiry: self
    )
  end
end
