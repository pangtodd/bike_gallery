require 'rails_helper'

describe "edit a bike process" do
  before(:each)do
  @user = User.create!(:email => 'testee@test.com', :password => 'Password@123', :admin => true)
  bike = Bike.create!(:name => 'Pork Chop', :make => 'Raleigh', :model=> "International",
                      :category=> "Road", :size=>"56cm/medium", :year=>1976, 
                      :description=> "super sweet ride!", :color=>"orange", :status=>"available", :price => 269)
  login_as(@user, :scope => :user)
  visit bikes_path
  end

  it "edits an existing bike" do
    click_on('Pork Chop', match: :first)
    click_on('Edit')
    fill_in 'Name', :with =>'Lamb Chop'
    click_on 'Update Bike'
    expect(page).to have_content 'Lamb Chop'
  end

  it "provides confirmation when product updated" do
    visit bikes_path
    click_on('Pork Chop', match: :first)
    click_on'Edit'
    fill_in 'Name', :with =>'Lamb Chop'
    click_on 'Update Bike'
    expect(page).to have_content 'Bike successfully updated'
  end

 

end