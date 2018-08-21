# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "create Users"

User.destroy_all
louis = User.create!(email: 'louis@gmail.com', password: "azerty", first_name: 'Louis', last_name: 'Sommer')
charlotte = User.create!(email: 'charlotte@gmail.com', password: "azerty", first_name: 'charlotte', last_name: 'Sommer')
julien = User.create!(email: 'julien@gmail.com', password: "azerty", first_name: 'julien', last_name: 'Sommer')

p User.all
