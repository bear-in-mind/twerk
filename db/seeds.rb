# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying records"
User.destroy_all
Talent.destroy_all
User.destroy_all

puts "Start seeding"

User.create!(
  first_name: "Maxime",
  last_name: "Garoute",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
  avatar: "profile_pictures/maxime"
)

User.create!(
  first_name: "Nicolas",
  last_name: "Bauguil",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
  avatar: "profile_pictures/bo"
)

User.create!(
  first_name: "Louis",
  last_name: "Sommer",
  city: "Paris",
  email: 'louis.sommer@gmail.com',
  password: "0123456",
  avatar: "profile_pictures/louis.jpg"
)

User.create!(
  first_name: "Benjamin",
  last_name: "Diamond",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
  avatar: "profile_pictures/BenjaminDiamond"
)

User.create!(
  first_name: "Johann",
  last_name: "Dalgaard",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
  avatar: "profile_pictures/johan"
)

User.create!(
  first_name: "Sebastien",
  last_name: "Teti",
  city: "Los Angeles",
  email: Faker::Internet.unique.email,
  password: "0123456",
  avatar: "profile_pictures/sebastien.jpg"
)

Talent.create(name: "Bass", user_id: 3)
Talent.create(name: "Drums", user_id: 1)
Talent.create(name: "Guitar", user_id: 2)
Talent.create(name: "Keyboards", user_id: 4)
Talent.create(name: "Vocals", user_id: 5)
Talent.create(name: "Mix Engineer", user_id: 6)

puts "Done seeding!"
