# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Dropping the seeds"
User.destroy_all if Rails.env.development? || Rails.env.test?
Category.destroy_all if Rails.env.development? || Rails.env.test?

puts "Creating the seeds"

puts 'create users'
User.create(
  email: 'user1@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'Mandy',
  remote_photo_url: "https://images.unsplash.com/photo-1525450824786-227cbef70703?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=1600",
)


User.create(
  email: 'user2@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'user2',
  remote_photo_url: "https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1581&q=80"
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
  name: 'Poultry'
)


puts 'create categories'
Category.create!(
  name: 'Vegetables'
)

puts 'create categories'
Category.create!(
  name: 'Canned Foods'
)

puts "create donor profile for first user"
Donor.create(
  full_name: 'Mandy Tan',
  bio: 'I love sharing food as the best way to anyone’s heart is through their stomach (;',
  pickup_time: '6pm',
  user: User.first
)

puts 'create foods'
Food.create!(
  name: "Ripe Banana (4 large ones)",
  remote_photo_url: "https://images.unsplash.com/photo-1571141380069-521a19e0576c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
  description: "Will be good for baking!",
  purchase_date: Date.new(2018,8,18),
  location: "360, #08-02 Orchard Rd, International Building, 238869",
  latitude: 1.2979,
  longitude: 103.8314,
  donor: Donor.first
)

FoodCategory.create(food: Food.last, category: Category.find_by(name: "Fruits"))

puts 'create foods'
Food.create!(
  name: "Carton of eggs",
  remote_photo_url: "https://images.unsplash.com/photo-1556910116-e220f7127371?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
  description: "Baked too much cake. Extra eggs to give away.",
  purchase_date: Date.new(2018,8,21),
  location: "14 Scotts Rd, Singapore 228213",
  latitude: 1.3040,
  longitude: 103.8320,
  donor: Donor.first
)

FoodCategory.create(food: Food.last, category: Category.find_by(name: "Dairy"))

puts 'create foods'
Food.create!(
  name: "Heinz Tomato Ketchup",
  remote_photo_url: "https://images.unsplash.com/flagged/photo-1569231290508-8105e6e9620c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
  description: "Free gift, but I don't like ketchup.",
  purchase_date: Date.new(2018,8,30),
  location: "313 Orchard Rd, Singapore 238895",
  latitude: 1.301040,
  longitude: 103.838379,
  donor: Donor.first
  )

FoodCategory.create(food: Food.last, category: Category.find_by(name: "Canned Foods"))

puts "create donation"
Donation.create(
  user: User.first,
  food: Food.first
  )

Donation.create(
  user: User.first,
  food: Food.last
  )

puts "create reviews of avg 4 for user.first"
Rating.create(
  rate: 5,
  review: "Mandy was so kind and amazing",
  donation: Donation.first,
  user: User.first
  )

Rating.create(
  rate: 3,
  review: "Mandy was late and wasn't very responsive",
  donation: Donation.last,
  user: User.first
  )
