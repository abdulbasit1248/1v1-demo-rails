class Booking < ApplicationRecord

  belongs_to :client
  belongs_to :provided_service
  belongs_to :entry
  has_one :service, through: :provided_service
  has_one :athlete, through: :provided_service

  enum status: {
    incomplete: "InComplete",
    completed: "Completed",
  }
end
