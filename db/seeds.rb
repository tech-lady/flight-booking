# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


states = [
  { name: "Abuja" },
  { name: "Enugu" },
  { name: "Kano" },
  { name: "Ibadan" },
  { name: "Akure" },
  { name: "Lagos" },
  { name: "Port Harcourt" },
  { name: "Bauchi" },
  { name: "Calabar" },
  { name: "Jos" },
  { name: "Kaduna" },
  { name: "Borno" },
  { name: "Sokoto" },
  { name: "Yola" }
]

states.each do |state|
  State.create(state)
end

created_state = State.all

airports = [
  { name: "Nnamdi Azikwe International Airport", city: "Abuja", state_id: created_state[1][:id] },
  { name: "Akanu Ibiam International Airport", city: "Enugu", state_id: created_state[2][:id] },
  { name: "Alakia Airport", city: "Ibadan", state_id: created_state[3][:id] },
  { name: "Arakale Airport", city: "Akure", state_id: created_state[4][:id] },
  { name: "Mallam Aminu Kano International Airport", city: "Kano", state_id: created_state[5][:id] },
  { name: "Murtala Muhammed International Airport", city: "Lagos", state_id: created_state[0][:id] },
  { name: "Port Harcourt International Airport", city: "Port Harcourt", state_id: created_state[1][:id] },
  { name: "Sir Abubakar Tafawa Balewa Airport", city: "Bauchi", state_id: created_state[2][:id] },
  { name: "Margaret Ekpo International Airport", city: "Calabar",state_id: created_state[3][:id] },
  { name: "Yakubu Gowon Airport", city: "Jos", state_id: created_state[4][:id] },
  { name: "Kaduna Airport", city: "Kaduna", state_id: created_state[5][:id] },
  { name: "Maiduguri International Airport", city: "Borno", state_id: created_state[0][:id] },
  { name: "Sadiq Abubakar III International Airport", city: "Sokoto", state_id: created_state[1][:id] },
  { name: "Yola Airport", city: "Yola", state_id: created_state[2][:id] }
]

airports.each do |airport|
  Airport.create(airport)
end

