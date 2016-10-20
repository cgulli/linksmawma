require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'
require_relative 'models/tag'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

# configure :test do
#   DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
# end
#
# configure :development do
#   DataMapper.setup(:default, "postgres://localhost/bookmark_manager_development")
# end
#
# configure :production do
#   DataMapper.setup(:default, ENV['DATABASE_URL'])
# end

DataMapper.finalize
DataMapper.auto_upgrade!
