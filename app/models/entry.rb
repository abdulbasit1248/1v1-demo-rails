class Entry < ApplicationRecord
  belongs_to :athlete
  has_one :booking
  has_one :booking_request

  
  scope :between, -> (date) {where(booking_date: date.beginning_of_month..date.end_of_month)}
end
