# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Destroy All'
Restaurant.destroy_all

puts 'Generate new Restaurant'
10.times do
  resto = Restaurant.create!(
  name: Faker::Restaurant.name,
  address: Faker::Address.street_address,
  phone_number: Faker::PhoneNumber.phone_number,
  category: Restaurant::CATEGORY.sample
)
  5.times do
    Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(1..5),
      restaurant_id: resto.id
  )
  end
end

puts 'Done'
