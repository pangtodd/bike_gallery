require 'faker'

Bike.destroy_all
Review.destroy_all
# User.destroy_all

# admin = User.create!(:email => 'admin@test.com', :password => 'Password@123', :admin => true)
# user = User.create!(:email => 'user@test.com', :password => 'Password@123')

10.times do |index|
  bike =  Bike.create!(name: Faker::Kpop.iii_groups,
                    make: Faker::
                    model: 
                    type:
                    size: 
                    year:
                    description:
                    color:
                    status:
                    price: Faker::Number.number(digits: 3),
                    created_at:
                    updated_at:
  5.times do |index|
    Review.create!(author: Faker::DcComics.name,
                    content_body: Faker::Hipster.paragraph_by_chars(characters: 100, supplemental: false),
                    rating: Faker::Number.between(from: 1, to: 5),
                    product_id: product.id)
  end
end
