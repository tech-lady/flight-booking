FactoryGirl.define do
  factory :aircraft do
    name "airport"
    tail_number "111-000HD"
    economy_class_capacity 40
    business_class_capacity 12
    first_class_capacity 6
  end
end
