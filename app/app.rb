require 'sinatra/base'
require_relative 'models/link'

class Bookmark < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'

  configure :test do
    DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
  end

  configure :development do
    DataMapper.setup(:default, "postgres://localhost/bookmark_manager_development")
  end

  configure :production do
    DataMapper.setup(:default, ENV['DATABASE_URL'])
  end

  DataMapper.finalize
  DataMapper.auto_upgrade!

get '/' do
  erb(:index)
end

  get '/links' do
    @links = Link.all
    erb(:links)
    end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  get '/links/new' do
    erb :new_links
  end

    run! if app_file == $0
end
