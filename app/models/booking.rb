class Booking < ApplicationRecord
  belongs_to :user, optional: true, :foreign_key => "users_id"
  belongs_to :flight, optional:true,  :foreign_key => "flight_id"
  has_one :payment
end
