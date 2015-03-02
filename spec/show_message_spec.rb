require 'spec_helper'

feature "show the list of messages" do 

  before(:each) do 
    Message.create(content: "Hello, world!")
  end

  scenario "when opening the homepage" do 
    visit '/'
    expect(page).to have_content("Hello, world!")
  end
end