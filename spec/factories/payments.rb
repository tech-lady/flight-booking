FactoryBot.define do
  factory :payment do
    payment_date { Time.zone.now }
    transaction_ref { "1234ABCD" }
    payment_status { "pending" }
  end
end
