require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative './models/message'

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do 
  @messages = Message.all
  erb :index
end 

post '/messages' do 
  Message.create(content: params[:content])
  redirect to '/'
end