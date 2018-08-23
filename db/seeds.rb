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
  genre: 'Pop, Funk, Disco',
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
  main_job: "Guitarist",
  genre: 'Funk, Disco, Rock, Pop'
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
  main_job: "Producer",
  genre: "Pop, Disco, Electro, RnB, Classical",
  bio: "I'm a musician, arranger and producer from Paris. Deeply influenced by black music, jazz, and electronic music, I will adapt to any project, in any genre, provided I'll have the right to make it groove!"
)

c.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855789/profile_pictures/louis.jpg"
c.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1534930591/banner_images/max_banner.jpg"
c.save

d = User.new(
  first_name: "Benjamin",
  last_name: "Diamond",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
  main_job: "Artist",
  genre: "Electro, House, Pop"
)

d.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855842/profile_pictures/BenjaminDiamond.jpg"
d.save

e = User.new(
  first_name: "Johann",
  last_name: "Dalgaard",
  city: "Paris",
  email: Faker::Internet.unique.email,
  password: "0123456",
  main_job: "Keyboardist",
  genre: "Pop, Blues, Rock, Funk"
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
  main_job: "Mixing Engineer",
  genre: "Electro, Pop"
)

f.remote_avatar_url = "https://res.cloudinary.com/twerk/image/upload/v1534855789/profile_pictures/sebastien.jpg"
f.remote_banner_url = "https://res.cloudinary.com/twerk/image/upload/v1534930591/banner_images/seb_banner.jpg"
f.save

Talent.create(name: "Bass", user: c)
Talent.create(name: "Arranger", user: c)
Talent.create(name: "Clarinet", user: c)
Talent.create(name: "Bass Clarinet", user: c)
Talent.create(name: "Keyboards", user: c)
Talent.create(name: "Ableton Live, Pro Tools", user: c)
Talent.create(name: "Drums", user: a)
Talent.create(name: "Percussions", user: a)
Talent.create(name: "Producer", user: a)
Talent.create(name: "Guitar", user: b)
Talent.create(name: "Keyboards", user: b)
Talent.create(name: "Producer", user: b)
Talent.create(name: "Keyboards", user: e)
Talent.create(name: "Accordeon", user: e)
Talent.create(name: "Arranger", user: e)
Talent.create(name: "Vocals", user: d)
Talent.create(name: "Producer", user: d)
Talent.create(name: "FOH Engineer", user: f)
Talent.create(name: "Recording Engineer", user: f)

Job.create!(talent_id: 7, user_id: e.id) # Supplier: Max, Client: Johann
Job.create!(talent_id: 2, user_id: a.id) # Supplier: Louis, Client: Max
Job.create!(talent_id: 7, user_id: c.id) # Supplier: Max, Client: Louis
Job.create!(talent_id: 1, user_id: e.id) # Supplier: Louis, Client: Johann

puts "Done seeding!"
