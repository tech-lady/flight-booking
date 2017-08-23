class Booking < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: "users_id"
  belongs_to :flight, optional: true, foreign_key: "flight_id"
  has_one :payment
  has_many :passengers

  
  validates :flight_id, presence: true
  validates :passenger_email, presence: true

  accepts_nested_attributes_for :passengers
end
