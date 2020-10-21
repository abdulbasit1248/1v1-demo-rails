class ProvidedService < ApplicationRecord
  belongs_to :athlete
  belongs_to :service
  has_many :bookings
  has_many :booking_requests
end
