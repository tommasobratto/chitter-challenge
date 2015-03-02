require 'sinatra'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative './models/message'
require_relative './models/user'
require_relative 'helpers'

DataMapper.finalize

DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'secret'

get '/' do 
  @messages = Message.all
  erb :index
end 

post '/messages' do 
  Message.create(content: params[:content])
  redirect to '/'
end

get '/users/new' do 
  erb :"/users/new"
end

post '/users' do 
  user = User.create(name: params[:name],email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect to '/'
end

