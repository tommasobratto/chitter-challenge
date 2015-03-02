require 'spec_helper'

feature "show the list of messages" do 

  before(:each) do 
    User.create(id: 1)
    Message.create(content: "Hello, world!", author: "John117")
  end

  scenario "when opening the homepage" do 
    visit '/'
    expect(page).to have_content("Hello, world! - John117")
  end
end