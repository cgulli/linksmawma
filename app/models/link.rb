require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'sinatra'

configure :test do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
end

configure :development do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_development")
end

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

class Link

  include DataMapper::Resource

  property :id,       Serial
  property :title,    String
  property :url,      String

end
