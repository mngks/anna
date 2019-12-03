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
  full_name: 'Mandy Tan',
  username: 'Mandy90',
  bio: 'ipsem lorem',
  pickup_time: 'Collection after 6pm',
  user: User.first
)


puts 'create categories'
Category.create!(
  name: 'Fruits'
)


puts 'create categories'
Category.create!(
  name: 'Dairy'
)


puts 'create categories'
Category.create!(
  name: 'Grains'
)


puts 'create categories'
Category.create!(
  name: 'Meats'
)


puts 'create categories'
Category.create!(
  name: 'Vegetables'
)

puts 'create categories'
Category.create!(
  name: 'Canned foods'
)


puts 'create foods'
Food.create!(
  name: "Ripe Banana (4 large ones)",
  photo: "",
  description: "Will be good for baking!",
  purchase_date: Date.new(2018,8,18),
  location: "360, #08-02 Orchard Rd, International Building, 238869",
  latitude: 33.976059,
  longitude: -116.955040,
  donor: Donor.first
)

FoodCategory.create(food: Food.last, category: Category.find_by(name: "Fruits"))

puts 'create foods'
Food.create!(
  name: "Carton of eggs",
  photo: "",
  description: "Baked too much cake. Extra eggs to give away.",
  purchase_date: Date.new(2018,8,21),
  location: "14 Scotts Rd, Singapore 228213",
  latitude: 1.307180,
  longitude: 103.833809,
  donor: Donor.first
)

FoodCategory.create(food: Food.last, category: Category.find_by(name: "Dairy"))

puts 'create foods'
Food.create!(
  name: "Heinz Tomato Ketchup",
  photo: "",
  description: "I dont like ketchup. Giving away.",
  purchase_date: Date.new(2018,8,30),
  location: "313 Orchard Rd, Singapore 238895",
  latitude: 1.301040,
  longitude: 103.838379,
  donor: Donor.first
  )

FoodCategory.create(food: Food.last, category: Category.find_by(name: "Canned foods"))

