class Athlete < ApplicationRecord
  include AuthHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entries
  has_one :school
  has_many :provided_services
  has_many :services, through: :provided_services
  accepts_nested_attributes_for :provided_services

  enum gender: {
    male: "Male",
    female: "Female"
  }
end
