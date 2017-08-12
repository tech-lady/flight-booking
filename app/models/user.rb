class User < ApplicationRecord
  has_many :bookings, foreign_key: "users_id"

  validates :first_name,
            :last_name,
            :email,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true
end
