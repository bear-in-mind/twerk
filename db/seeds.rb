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

a = User.new(
  first_name: "Maxime",
  last_name: "Garoute",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
)
a.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855650/profile_pictures/maxime.jpg"
a.save

b = User.new(
  first_name: "Nicolas",
  last_name: "Bauguil",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
)

b.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855650/profile_pictures/bogue.jpg"
b.save

c = User.new(
  first_name: "Louis",
  last_name: "Sommer",
  city: "Paris",
  email: 'louis.sommer@gmail.com',
  password: "0123456",
)

c.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855789/profile_pictures/louis.jpg"
c.save

d = User.new(
  first_name: "Benjamin",
  last_name: "Diamond",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
)

d.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855842/profile_pictures/BenjaminDiamond.jpg"
d.save

e = User.new(
  first_name: "Johann",
  last_name: "Dalgaard",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
)

e.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855790/profile_pictures/johan.jpg"
e.save

f = User.new(
  first_name: "Sebastien",
  last_name: "Teti",
  city: "Los Angeles",
  email: Faker::Internet.unique.email,
  password: "0123456",
)

f.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855789/profile_pictures/sebastien.jpg"
f.save

Talent.create!(name: "Bass", user: User.find_by(first_name: "Louis"))
Talent.create(name: "Drums", user: User.find_by(first_name: "Maxime"))
Talent.create(name: "Guitar", user: User.find_by(first_name: "Nicolas"))
Talent.create(name: "Keyboards", user: User.find_by(first_name: "Johann"))
Talent.create(name: "Vocals", user: User.find_by(first_name: "Benjamin"))
Talent.create(name: "Mix Engineer", user: User.find_by(first_name: "Sebastien"))


puts "Done seeding!"
