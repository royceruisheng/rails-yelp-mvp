require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times {
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  puts "Creating restaurant"
  Restaurant.create({
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    category: category
  })
}

Restaurant.all.each do |restaurant|
  # 0-10 reviews
  rand_num = rand(7)
  rand_num.times {
    rand_rating = rand(6)
    puts "Creating rating for #{restaurant.name}"
    Review.create({
      rating: rand_rating,
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    })
  }
end
