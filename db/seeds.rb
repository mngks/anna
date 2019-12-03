# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Dropping the seeds"
User.destroy_all if Rails.env.development? || Rails.env.test?


puts "Creating the seeds"

puts 'create users'
User.create(
  email: 'user1@gmail.com',
  password: 'user123',
  password_confirmation: 'user123'
)


User.create(
  email: 'user2@gmail.com',
  password: 'user123' ,
  password_confirmation: 'user123'
)


puts "create donor profile for first user"
Donor.create(
  full_name: 'Mandy',
  username: 'Tan',
  bio: 'ipsem lorem',
  pickup_time: '6 pm',
  user: User.first
)

puts 'create foods'
Food.create!(
  name: "Ripe Banana (4 large ones)",
  photo: "",
  description: "Bought too much for my family, would be good for baking.",
  purchase_date: "18-08-2018",
  location: "360, #08-02 Orchard Rd, International Building, 238869",
  latitude: "33.976059",
  longtitude: "-116.955040",
  donor: Donor.first
)

puts 'create foods'
Food.create!(
  name: "Carton of eggs",
  photo: "",
  description: "Baked too much cake. Had extras eggs.",
  purchase_date: "21-08-2018",
  location: "14 Scotts Rd, Singapore 228213",
  latitude: "1.307180",
  longtitude: "103.833809",
  donor: Donor.first
)

puts 'create foods'
Food.create!(
  name: "Heinz Tomato Ketchup",
  photo: "",
  description: "I dont like ketchup. Giving away.",
  purchase_date: "21-08-2018",
  location: "313 Orchard Rd, Singapore 238895",
  latitude: "1.301040",
  longtitude: "103.838379",
  donor: Donor.first
)


