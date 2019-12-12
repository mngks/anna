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
  email: 'charmaine@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'Charmaine',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576118625/IMG_9658_d4eefw.jpg",
  bio: 'I love sharing food as the best way to anyone’s heart is through their stomach (;',
  preferred_start_time: '6pm',
  preferred_end_time: '8pm',
)

User.create(
  email: 'mike@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'Mike',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576118641/Screenshot_20191211-192104_Tinder-01_qg7ghb.jpg"
)

User.create(
  email: 'mandy123@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'Mandy',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1576150651/mandy1_mos32k.jpg"
)

User.create(
  email: 'anna123@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'Anna',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1576150801/anna1_ghy2fj.jpg"
)

User.create(
  email: 'george123@gmail.com',
  password: 'user123',
  password_confirmation: 'user123',
  username: 'George',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1576150964/george1_qzrtye.jpg"
)


puts 'create categories'

fruits = Category.create!(
  name: 'Fruits',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576134732/Screenshot_2019-12-12_at_3.10.51_PM_bdfycp.png"
)


dairy = Category.create!(
  name: 'Dairy',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576134537/Screenshot_2019-12-12_at_3.05.44_PM_fscbou.png"
)

snacks = Category.create!(
  name: 'Snacks',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/c_thumb,w_200,g_face/v1576119575/snack2_ch6ycl.jpg"
)

vegetables = Category.create!(
  name: 'Vegetables',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576135447/Screenshot_2019-12-12_at_3.22.14_PM_kfcs7t.png"
)

grains = Category.create!(
  name: 'Grains',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576134617/Screenshot_2019-12-12_at_3.03.38_PM_hsaqly.png"
)

canned_foods = Category.create!(
  name: 'Canned Foods',
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576119343/Canned-Food-Drive_canned_food_drive_16x9_abc9a6cb-e610-49e3-9252-c25be5a1b34b_tjnljh.jpg"
)

puts "create donor profile"

Donor.create(
  full_name: 'Charmaine',
  contact_number: '91234567',
  user: User.find_by(email:'charmaine@gmail.com')
)

Donor.create(
  full_name: 'Mike',
  contact_number: '91234577',
  user: User.find_by(email:'mike@gmail.com')
)

Donor.create(
  full_name: 'Mandy',
  contact_number: '82346278',
  user: User.find_by(email:'mandy123@gmail.com')
)

Donor.create(
  full_name: 'Anna',
  contact_number: '82346678',
  user: User.find_by(email:'anna123@gmail.com')
)

Donor.create(
  full_name: 'George',
  contact_number: '82345674',
  user: User.find_by(email:'george123@gmail.com')
)

puts 'create foods'
Food.create!(
  name: "A packet of tomatoes",
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576120940/Screenshot_2019-12-12_at_11.18.30_AM_jumpr0.png",
  description: "Unused pack of tomatoes",
  purchase_date: Date.new(2018,12,9),
  location: "360, #08-02 Orchard Rd, International Building, 238869",
  latitude: 1.2979,
  longitude: 103.8314,
  donor: Donor.find_by(full_name: 'Mike'),
  categories: [vegetables]
)


Food.create!(
  name: "A carton of eggs",
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576129879/Screenshot_2019-12-12_at_1.49.57_PM_gefbzw.png",
  description: "Baked too much cake. Extra eggs to give away.",
  purchase_date: Date.new(2018,12,4),
  location: "14 Scotts Rd, Singapore 228213",
  latitude: 1.3040,
  longitude: 103.8320,
  donor: Donor.find_by(full_name: 'Mandy'),
  categories: [dairy]
)

Food.create!(
  name: "Premium brown pears",
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576135069/pear_etrhmn.jpg",
  description: "3 brown pears bought from NTUC.",
  purchase_date: Date.new(2018,12,1),
  location: "313 Orchard Rd, Singapore 238895",
  latitude: 1.301040,
  longitude: 103.838379,
  donor: Donor.find_by(full_name: 'Charmaine'),
  categories: [fruits]
)


Food.create!(
  name: "A box of 12 Granola Bars",
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576121608/granola_bars_yilxub.jpg",
  description: "A box of 12 Granola Bars received a week ago.",
  purchase_date: Date.new(2018,12,6),
  location: "313 Orchard Rd, Singapore 238895",
  latitude: 1.301040,
  longitude: 103.838379,
  donor: Donor.find_by(full_name: 'Anna'),
  categories: [snacks]
)

Food.create!(
  name: "A can of Campbell's soup",
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576134009/Screenshot_2019-12-12_at_2.59.29_PM_ku3fh4.png",
  description: "Giving away Campbell's Condensed Soup - Cream of Mushroom.",
  purchase_date: Date.new(2018,12,5),
  location: "313 Orchard Rd, Singapore 238895",
  latitude: 1.301040,
  longitude: 103.838379,
  donor: Donor.find_by(full_name: 'Mike'),
  categories: [canned_foods]
)


Food.create!(
  name: "A carton of milk",
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576136651/milk_dawtsi.jpg",
  description: "My kids don't drink this milk.",
  purchase_date: Date.new(2018,12,12),
  location: "14 Scotts Rd, Singapore 228213",
  latitude: 1.3040,
  longitude: 103.8320,
  donor: Donor.find_by(full_name: 'Anna'),
  categories: [dairy]
)


Food.create!(
  name: "A tub of vanilla yogurt",
  remote_photo_url: "https://res.cloudinary.com/df8xepdmu/image/upload/v1576121978/Screenshot_2019-12-12_at_11.38.34_AM_cv9rme.png",
  description: "A tub of vanilla yogurt unopened.",
  purchase_date: Date.new(2018,8,21),
  location: "14 Scotts Rd, Singapore 228213",
  latitude: 1.3040,
  longitude: 103.8320,
  donor: Donor.find_by(full_name: 'George'),
  categories: [dairy]
)

puts "create donation"
Donation.create!(
  user: User.find_by(username: 'Anna'),
  food: Food.first
  )

Donation.create!(
  user: User.find_by(username: 'Mandy'),
  food: Food.last
  )

Donation.create!(
  user: User.find_by(username: 'George'),
  food: Food.last
  )

Donation.create!(
  user: User.find_by(username: 'Charmaine'),
  food: Food.last
  )
