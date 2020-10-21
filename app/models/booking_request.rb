class BookingRequest < ApplicationRecord
  belongs_to :client
  belongs_to :provided_service
  belongs_to :entry
  has_one :service, through: :provided_service
  has_one :athlete, through: :provided_service

  enum status: {
    in_cart: "In Cart",
    pending: "Pending",
    accepted: "Accepted",
    rejected: "Rejected",
  }
end
