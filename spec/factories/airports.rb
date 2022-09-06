FactoryBot.define do
  factory :airport do
    name { "JJC Airport" }
    city { "Lagos" }
    iata_code { "NG" }
    state_id { create(:state).id }
  end
end
