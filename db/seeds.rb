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
  main_job: "Drummer",
  bio: "I'm a French drummer with deep roots in 80s american culture. I was very influenced by artists like Peter Gabriel, Toto, Michael Jackson and Price. My band is called Venice!"
)
a.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855650/profile_pictures/maxime.jpg"
a.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1534930591/banner_images/max_banner.jpg"
a.save

b = User.new(
  first_name: "Nicolas",
  last_name: "Bauguil",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
  main_job: "Guitarist"
)

b.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855650/profile_pictures/bogue.jpg"
b.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1534930591/banner_images/bogue_banner.jpg"
b.save

c = User.new(
  first_name: "Louis",
  last_name: "Sommer",
  city: "Paris",
  email: 'louis.sommer@gmail.com',
  password: "0123456",
  main_job: "Producer"
)

c.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855789/profile_pictures/louis.jpg"
c.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1534855789/profile_pictures/louis.jpg"
c.save

d = User.new(
  first_name: "Benjamin",
  last_name: "Diamond",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
  main_job: "Artist"
)

d.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855842/profile_pictures/BenjaminDiamond.jpg"
d.save

e = User.new(
  first_name: "Johann",
  last_name: "Dalgaard",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
  main_job: "Keyboardist"
)

e.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855790/profile_pictures/johan.jpg"
e.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1534930591/banner_images/johan_banner.jpg"
e.save

f = User.new(
  first_name: "Sebastien",
  last_name: "Teti",
  city: "Los Angeles",
  email: Faker::Internet.unique.email,
  password: "0123456",
  main_job: "Mixing Engineer"
)

f.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855789/profile_pictures/sebastien.jpg"
f.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1534930591/banner_images/seb_banner.jpg"
f.save

Talent.create!(name: "Bass", user: User.find_by(first_name: "Louis"))
Talent.create!(name: "Arranger", user: User.find_by(first_name: "Louis"))
Talent.create!(name: "Clarinet", user: User.find_by(first_name: "Louis"))
Talent.create!(name: "Bass Clarinet", user: User.find_by(first_name: "Louis"))
Talent.create!(name: "Keyboards", user: User.find_by(first_name: "Louis"))
Talent.create!(name: "Ableton Live, Pro Tools", user: User.find_by(first_name: "Louis"))
Talent.create(name: "Drums", user: User.find_by(first_name: "Maxime"))
Talent.create(name: "Percussions", user: User.find_by(first_name: "Maxime"))
Talent.create(name: "Producer", user: User.find_by(first_name: "Maxime"))
Talent.create(name: "Guitar", user: User.find_by(first_name: "Nicolas"))
Talent.create(name: "Keyboards", user: User.find_by(first_name: "Nicolas"))
Talent.create(name: "Producer", user: User.find_by(first_name: "Nicolas"))
Talent.create(name: "Keyboards", user: User.find_by(first_name: "Johann"))
Talent.create(name: "Accordeon", user: User.find_by(first_name: "Johann"))
Talent.create(name: "Arranger", user: User.find_by(first_name: "Johann"))
Talent.create(name: "Vocals", user: User.find_by(first_name: "Benjamin"))
Talent.create(name: "Producer", user: User.find_by(first_name: "Benjamin"))
Talent.create(name: "FOH Engineer", user: User.find_by(first_name: "Sebastien"))
Talent.create(name: "Recording Engineer", user: User.find_by(first_name: "Sebastien"))


puts "Done seeding!"
