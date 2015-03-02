require 'spec_helper'

feature 'User sends messages' do 

  scenario "while in the homepage" do 
    expect(Message.count).to eq 0
    visit '/'
    send_message("Hello, world!")
    expect(Message.count).to eq 1
    message = Message.first
    expect(message.content).to eq "Hello, world!"
  end

  def send_message(content)
    within('#new_message') do 
      fill_in 'content', :with => "Hello, world!"
      click_on 'send'
    end
  end
end