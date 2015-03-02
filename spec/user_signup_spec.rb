require 'spec_helper'

feature "User signs up" do 

  scenario "as a new user" do 
    visit '/'
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome John117"
    expect(User.first.name).to eq "John117"
  end

  def sign_up(name = "John117", email = "mcpo@unsc.com", password = "0451")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :name, with: "John117"
    fill_in :email, with: "mcpo@unsc.com"
    fill_in :password, with: "0451"
    click_on 'sign up'
  end
end