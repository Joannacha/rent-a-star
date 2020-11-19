# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting the seed"




10.times do
  users = User.new(
    email: Faker::Internet.email,
    password: "azerty",
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  users.save!
end

users =  User.all
u_ids = []
users.each do |user|
  u_ids << user.id
end

15.times do
  star = Star.new(
    name: Faker::Space.unique.star,
    price: rand(100..10000),
    user_id: u_ids.sample(1).first.to_i,
    galaxy: Faker::Space.galaxy,
    description: Faker::Lorem.paragraph
  )
  star.save!
end

# 10.times do
#   star = Star.new(
#     name: Faker::Movies::StarWars.unique.planet,
#     price: rand(100..10000),
#     user_id: rand(25..34),
#     galaxy: Faker::Space.galaxy,
#     description: Faker::Lorem.paragraph
#   )
#   star.save!
# end
stars = Star.all
s_ids = []
stars.each do |star|
  s_ids << star.id
end

20.times do
  bookings = Booking.new(
    start_date: Faker::Date.backward(days: rand(1..25)),
    end_date: Faker::Date.forward(days: rand(1..25)),
    user_id: u_ids.sample(1).first.to_i,
    star_id: s_ids.sample(1).first.to_i
  )
  bookings.save!
end

puts "Seed is done"
