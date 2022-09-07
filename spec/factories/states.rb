FactoryBot.define do
  factory :state do
    name { "Abuja" }
    country_id { create(:country).id }
  end
end
