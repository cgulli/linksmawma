ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
# require_relative 'models/link'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

get '/' do
  erb(:index)
end

  get '/links' do
    @links = Link.all
    erb(:links)
    end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(tag: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :new_links
  end

  get '/tags' do
    tag = Tag.first(tag: params[:tag])
    @links = tag ? tag.links : []
    erb :links
  end

    run! if app_file == $0
end
