require 'rails_helper'

describe "the edit review process" do
  before(:each) do
    visit new_bike_path
    click_link 'Sign up'
    fill_in 'user_email', with: 'admin@aol.com'
    fill_in 'user_password', with: 'dogdog'
    fill_in 'user_password_confirmation', with: 'dogdog'
    click_button 'Sign up'
    @user = User.last
    @user.update(admin: true)
    visit new_bike_path
  end

  it "edits a review" do
    bike = Bike.create(:name => 'Bill', :make => 'Huffy', :model => 'xtreme', :category => 'trail', :size => 'medium', :year => '1999', :description => 'big offroady boi', :color => 'magenta', :status => 'stolen', :price => '100')
    review = Review.create(:author => 'Jimbo', :content => "that dang ol bike was the best I ever had rode it every day for 12 years until I turned 10.", :rating => '5', :bike_id => bike.id)
    visit edit_bike_review_path(bike, review)
    fill_in 'Author', :with => 'Tim'
    click_on 'Update Review'
    expect(page).to have_content 'Tim'
  end

  it "returns error when author left blank" do
    bike = Bike.create(:name => 'Bill', :make => 'Huffy', :model => 'xtreme', :category => 'trail', :size => 'medium', :year => '1999', :description => 'big offroady boi', :color => 'magenta', :status => 'stolen', :price => '100')
    review = Review.create(:author => 'Jimbo', :content => "that dang ol bike was the best I ever had rode it every day for 12 years until I turned 10.", :rating => '5', :bike_id => bike.id)
    visit edit_bike_review_path(bike, review)
    fill_in 'Author', :with => ''
    click_on 'Update Review'
    expect(page).to have_content 'error'
  end

  it "deletes reviews" do
    bike = Bike.create(:name => 'Bill', :make => 'Huffy', :model => 'xtreme', :category => 'trail', :size => 'medium', :year => '1999', :description => 'big offroady boi', :color => 'magenta', :status => 'stolen', :price => '100')
    review = Review.create(:author => 'Jimbo', :content => "that dang ol bike was the best I ever had rode it every day for 12 years until I turned 10.", :rating => '5', :bike_id => bike.id)
    visit bike_review_path(bike, review)
    click_on 'Delete'
    expect(page).not_to have_content "that dang ol bike was the best I ever had rode it every day for 12 years until I turned 10."
  end
end