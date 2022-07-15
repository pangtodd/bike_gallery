
require 'faker'

Bike.destroy_all
Review.destroy_all
User.destroy_all


admin = User.create!(:email => 'admin@test.com', :password => 'password', :admin => true)
user = User.create!(:email => 'user@test.com', :password => 'password')
10.times do |index|
bike = Bike.create!(name: Faker::Kpop.iii_groups,
    make: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    category: Faker::Vehicle.model(make_of_model: 'Toyota'),
    size: Faker::Creature::Dog.size,
    year: Faker::Vehicle.year,
    description:  Faker::Hipster.paragraph_by_chars(characters: 100, supplemental: false),
    color: Faker::Vehicle.color,
    status: ["available", "unavailable"].sample,
    price: Faker::Number.number(digits: 3)
  )
5.times do |index|
  Review.create!(author: Faker::DcComics.name,
    content: Faker::Hipster.paragraph_by_chars(characters: 100, supplemental: false),
    rating: Faker::Number.between(from: 1, to: 5),
    bike_id: bike.id
  )
  end
  p "Created #{Review.count} reviews"
end
p "Created #{Bike.count} bikes"
