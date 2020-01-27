# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  Team.create!(name: 'Super Admin')
  Team.create!(name: 'Hotel Admin')
  Team.create!(name: 'Co-Ordinator')
  Team.create!(name: 'Normal User')
  User.create!(team_id: 1, gender: 'male', email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  Hotel.create!(name: "Hilton Garden Inn Singapore Rooms", far_from_mrt: "below_2kms", far_from_airport: "below_2kms", far_from_busstand: "below_5kms", star: "2 Star", address:"3 Dickson Road, Singapore 209530, Central Singapore Singapore 209530")
  Hotel.create!(name: "Premium Hostel Singapore", far_from_mrt: "below_2kms", far_from_airport: "below_2kms", far_from_busstand: "below_5kms", star: "2 Star", address:"91A, 93A And 95A Owen Road, 218907 Singapore, Central Singapore Singapore 218907")
  RoomType.create!(name: "Premium Hostel Rooms One", no_of_adult: 2, no_of_child: 1, include_breakfast: true, room_size:  'single', bathroom_size: 'medium', bed_size: 'queen', price: 535, hotel_id: 2)
  RoomType.create!(name: "Premium Hostel Rooms Two", no_of_adult: 2, no_of_child: 4, include_breakfast: true, room_size:  'double', bathroom_size: 'large', bed_size: 'queen', price: 550, hotel_id: 2)
  RoomType.create!(name: "Premium Hostel Rooms Three", no_of_adult: 4, no_of_child: 3, include_breakfast: true, room_size:  'double', bathroom_size: 'large', bed_size: 'queen', price: 1500, hotel_id: 2)
  RoomType.create!(name: "Premium Hostel Rooms Four", no_of_adult: 6, no_of_child: 4, include_breakfast: true, room_size:  'double', bathroom_size: 'large', bed_size: 'queen', price: 2500, hotel_id: 2)
  RoomType.create!(name: "HotelABC Rooms Five", no_of_adult: 8, no_of_child: 4, include_breakfast: true, room_size:  'double', bathroom_size: 'large', bed_size: 'queen', price: 3000, hotel_id: 2)
  RoomType.create!(name: "Hilton Garden Inn Singapore Rooms One", no_of_adult: 8, no_of_child: 4, include_breakfast: true, room_size:  'double', bathroom_size: 'large', bed_size: 'queen', price: 3000, hotel_id: 1)
  RoomType.create!(name: "Hilton Garden Inn Singapore Rooms Two", no_of_adult: 8, no_of_child: 4, include_breakfast: true, room_size:  'double', bathroom_size: 'large', bed_size: 'queen', price: 3000, hotel_id: 1)
  RoomType.create!(name: "Hilton Garden Inn Singapore Rooms Three", no_of_adult: 8, no_of_child: 4, include_breakfast: true, room_size:  'double', bathroom_size: 'large', bed_size: 'queen', price: 3000, hotel_id: 1)
  RoomType.create!(name: "Hilton Garden Inn Singapore Rooms Four", no_of_adult: 8, no_of_child: 4, include_breakfast: true, room_size:  'double', bathroom_size: 'large', bed_size: 'queen', price: 3000, hotel_id: 1)
  RoomType.create!(name: "Hilton Garden Inn Singapore Rooms Five", no_of_adult: 8, no_of_child: 4, include_breakfast: true, room_size:  'double', bathroom_size: 'large', bed_size: 'queen', price: 3000, hotel_id: 1)
end
