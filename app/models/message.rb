class Message 

  include DataMapper::Resource

  property :id, Serial
  property :content, String 
  property :author, String
  
end