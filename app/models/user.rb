class User < ApplicationRecord
  has_secure_password

  has_many :bookings, foreign_key: "users_id"

  validates :first_name,
            :last_name,
            presence: true
  validates :email,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
              on: :create
            },
            presence: true,
            uniqueness: true
end
