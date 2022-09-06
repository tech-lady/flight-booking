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
  { name: "Dutse International Airport", city: "dutse", state_id: created_state[3][:id] },
  { name: "Ilorin Airport Airport", city: "Ilorin", state_id: created_state[4][:id] },
  { name: "Mallam Aminu Kano International Airport", city: "Kano", state_id: created_state[5][:id] },
  { name: "Murtala Muhammed International Airport", city: "Lagos", state_id: created_state[0][:id] },
  { name: "Port Harcourt International Airport", city: "Port Harcourt", state_id: created_state[1][:id] },
  { name: "Sir Abubakar Tafawa Balewa Airport", city: "Bauchi", state_id: created_state[2][:id] },
  { name: "Margaret Ekpo International Airport", city: "Calabar",state_id: created_state[3][:id] },
  { name: "YSam Mbakwe Airport", city: "Imo", state_id: created_state[4][:id] },
  { name: "Kaduna Airport", city: "Kaduna", state_id: created_state[5][:id] },
  { name: "Maiduguri International Airport", city: "Borno", state_id: created_state[0][:id] },
  { name: "Sadiq Abubakar III International Airport", city: "Sokoto", state_id: created_state[1][:id] },
  { name: "Yola Airport", city: "Yola", state_id: created_state[2][:id] }
]

airports.each do |airport|
  Airport.create(airport)
end

aircrafts = [
  { name: "Arik Air", tail_number: "6556757" },
  { name: "Dana Air", tail_number: "7665676" },
  { name: "Sosoliso Air", tail_number: "7555568"},
  { name: "Nigerian Airways", tail_number: "64474545"},
  { name: "Francais Air", tail_number: "76575556"},
  { name: "Comet Airways", tail_number: "316615447"},
  { name: "Idiva Air", tail_number: "632135544"},
  { name: "Spanish Air", tail_number: "1341543414"},
  { name: "Gitso Airstrip", tail_number: "3154564641"},
  { name: "Edo Airways", tail_number: "325432165"},
  { name: "Nguru Airstrip", tail_number: "676512532"},
  { name: "Empath Airways", tail_number: "6838567235"},
  { name: "Laplace Airways", tail_number: "6838567235"}
]

aircrafts.each do |aircraft|
  Aircraft.create(aircraft)
end
