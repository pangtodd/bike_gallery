require 'rails_helper'

describe "add a bike" do
  before:each do
    visit new_bike_path
    click_link'Sign up'
    fill_in'user_email', with: 'userexample@gmail.com'
    fill_in'Password', with: 'userpassword'
    fill_in'user_password_confirmation', with: 'userpassword'
    click_button'Sign up'
    @user = User.last
    @user.update(admin: true)
    visit new_bike_path
  end
  
  it "adds a new bike" do
    visit new_bike_path
    click_link 'New Bike'
    fill_in 'Name', :with => 'Bob'
    fill_in 'Price', :with => '2'
    fill_in 'Make', :with => 'Yonex'
    fill_in 'Model', :with => 'Bobsmodel'
    fill_in 'Category', :with => 'Adults'
    fill_in 'Size', :with => 'xs'
    fill_in 'Year', :with => '1975'
    fill_in 'bike[description]', :with => 'Beutiful'
    fill_in 'Color', :with => 'Blue'
    fill_in 'Status', :with => 'Not sold'
    click_button 'Create Bike'
    expect(page).to have_content 'Bikes'
  end

  it "gives an error if it is left blank" do
    visit new_bike_path
    click_on 'Create Bike'
    expect(page).to have_content 'Oops..Looks like there was an error in creating your bike. Try again.'
  end
end