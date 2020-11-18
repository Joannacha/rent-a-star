# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting the seed"

30.times do
  star = Star.new(
    name: Faker::Space.unique.star,
    price: rand(1..20000),
    user_id: rand(2..6)
  )
  star.save!
end

puts "Seed is done"