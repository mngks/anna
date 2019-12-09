# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

puts "Dropping the seeds"
Review.destroy_all
User.destroy_all
Category.destroy_all

puts "Creating the seeds"

puts 'create users'
User.create(
  email: 'user1@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'Mandy',
  remote_photo_url: "https://images.unsplash.com/photo-1525450824786-227cbef70703?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=1600",
  bio: 'I love sharing food as the best way to anyone’s heart is through their stomach (;',
  preferred_start_time: '6pm',
  preferred_end_time: '8pm',
)


User.create(
  email: 'user2@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'user2',
  remote_photo_url: "https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1581&q=80"
)

User.create(
  email: 'user3@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'user3',
  remote_photo_url: "https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1581&q=80"
)

User.create(
  email: 'user4@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'user4',
  remote_photo_url: "https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1581&q=80"
)


puts 'create categories'
fruits = Category.create!(
  name: 'Fruits',
  remote_photo_url: "https://images.unsplash.com/photo-1521732813055-61b789f61463?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
)


dairy = Category.create!(
  name: 'Dairy',
  remote_photo_url: "https://images.unsplash.com/photo-1528750997573-59b89d56f4f7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=866&q=80"
)


grains = Category.create!(
  name: 'Grains',
  remote_photo_url: "https://images.unsplash.com/photo-1542990253-a781e04c0082?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=984&q=80"
)


poultry = Category.create!(
  name: 'Poultry',
  remote_photo_url: "https://images.unsplash.com/photo-1529856426070-e610ede5a2fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"
)


vegetables = Category.create!(
  name: 'Vegetables',
  remote_photo_url: "https://images.unsplash.com/photo-1538159021332-8f28e9eca2fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"
)

canned_foods = Category.create!(
  name: 'Canned Foods',
  remote_photo_url: "https://images.unsplash.com/photo-1534483509719-3feaee7c30da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"
)

puts "create donor profile for first user"
Donor.create(
  full_name: 'Mandy Tan',
  contact_number: '91234567',
  user: User.first
)

Donor.create(
  full_name: 'User 4',
  contact_number: '82345674',
  user: User.last
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
  donor: Donor.first,
  categories: [fruits]
)


Food.create!(
  name: "Carton of eggs",
  remote_photo_url: "https://images.unsplash.com/photo-1556910116-e220f7127371?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
  description: "Baked too much cake. Extra eggs to give away.",
  purchase_date: Date.new(2018,8,21),
  location: "14 Scotts Rd, Singapore 228213",
  latitude: 1.3040,
  longitude: 103.8320,
  donor: Donor.first,
  categories: [dairy]
)


Food.create!(
  name: "Heinz Tomato Ketchup",
  remote_photo_url: "https://images.unsplash.com/flagged/photo-1569231290508-8105e6e9620c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
  description: "Free gift, but I don't like ketchup.",
  purchase_date: Date.new(2018,8,30),
  location: "313 Orchard Rd, Singapore 238895",
  latitude: 1.301040,
  longitude: 103.838379,
  donor: Donor.last,
  categories: [canned_foods]
)


Food.create!(
  name: "A bunch of 6 apples",
  remote_photo_url: "https://images.unsplash.com/flagged/photo-1569231290508-8105e6e9620c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
  description: "6 apples from NTUC",
  purchase_date: Date.new(2018,8,15),
  location: "313 Orchard Rd, Singapore 238895",
  latitude: 1.301040,
  longitude: 103.838379,
  donor: Donor.last,
  categories: [fruits]
)


Food.create!(
  name: "A bunch of 4 oranges",
  remote_photo_url: "https://images.unsplash.com/flagged/photo-1569231290508-8105e6e9620c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
  description: "4 oranges from NTUC",
  purchase_date: Date.new(2018,8,15),
  location: "313 Orchard Rd, Singapore 238895",
  latitude: 1.301040,
  longitude: 103.838379,
  donor: Donor.first,
  categories: [fruits]
)


Food.create!(
  name: "A carton of milk",
  remote_photo_url: "https://images.unsplash.com/photo-1556910116-e220f7127371?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
  description: "A carton of milk.",
  purchase_date: Date.new(2018,8,21),
  location: "14 Scotts Rd, Singapore 228213",
  latitude: 1.3040,
  longitude: 103.8320,
  donor: Donor.last,
  categories: [dairy]
)


Food.create!(
  name: "A tub of yogurt",
  remote_photo_url: "https://images.unsplash.com/photo-1556910116-e220f7127371?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
  description: "A tub of yogurt.",
  purchase_date: Date.new(2018,8,21),
  location: "14 Scotts Rd, Singapore 228213",
  latitude: 1.3040,
  longitude: 103.8320,
  donor: Donor.first,
  categories: [dairy]
)

puts "create donation"
Donation.create!(
  user: User.find_by(username: 'user3'),
  food: Food.first
  )

Donation.create!(
  user: User.find_by(username: 'user2'),
  food: Food.last
  )
