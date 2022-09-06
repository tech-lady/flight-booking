FactoryBot.define do
  factory :user do
    first_name { "yemi" }
    last_name { "blessed" }
    email { "someone@example.com" }
    password { "password" }
    confirm_password { "password" }
  end
end
