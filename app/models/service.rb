class Service < ApplicationRecord
  has_many :provided_services, dependent: :destroy
  has_many :athletes, through: :provided_services
end
