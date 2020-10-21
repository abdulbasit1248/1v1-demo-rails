class Client < ApplicationRecord

  has_many :bookings
  has_many :booking_requests
  enum gender: {
    male: "Male",
    female: "Female"
  }
end
