class Payment < ApplicationRecord
  belongs_to :booking, required: true, foreign_key: "booking_id"
end
