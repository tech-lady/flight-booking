FactoryGirl.define do
  factory :flight do
    airport_id { create(:airport).id }
    aircraft_id { create(:aircraft).id }
    departure_date Time.zone.tomorrow.strftime("%d/%m/%Y")
    origin_id { create(:airport).id }
    destination_id { create(:airport).id }
    available_seats { Faker::Number.between(2, 6) }

    trait(:departed) do
      departure_date Time.zone.now.strftime("%d/%m/%Y")
    end
  end
end
