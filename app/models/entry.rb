class Entry < ApplicationRecord
  belongs_to :athlete
  has_one :booking
  has_one :booking_request
end
