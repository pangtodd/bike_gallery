require 'rails_helper'

describe "the add a review process" do
  before(:each) do
    visit new_bike_path
    click_link 'Sign Up'
    fill_in 'user_email', with: 'user@aol.com'
    fill_in 'user_password', with: 'dogdog'
    fill_in 'user_password_confirmation', with: 'dogdog'
    click_button 'Sign up'
  end

  it "adds a new review" do
    bike = Bike.create(:name => 'Bill', :make => 'Huffy', :model => 'xtreme', :category => 'trail', :size => 'medium', :year => '1999', :description => 'big offroady boi', :color => 'magenta', :status => 'stolen', :price => '100')
    visit bike_path(bike)
    click_link 'Add a review'
    fill_in 'Author', :with => "Jimbo"
    fill_in 'Content', :with => 'that dang ol bike was the best I ever had rode it every day for 12 years until I turned 10.'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Jimbo'
  end

  it "returns an error when form is left blank" do
    bike = Bike.create(:name => 'Bill', :make => 'Huffy', :model => 'xtreme', :category => 'trail', :size => 'medium', :year => '1999', :description => 'big offroady boi', :color => 'magenta', :status => 'stolen', :price => '100')
    visit bike_path(bike)
    click_link 'Add a review'
    click_on 'Create Review'
    expect(page).to have_content 'error'
  end
end