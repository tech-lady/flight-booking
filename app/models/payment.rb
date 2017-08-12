class Payment < ApplicationRecord
  belongs_to :booking, optional: true, foreign_key: "booking_id"
end
