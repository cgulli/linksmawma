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
    tag = Tag.first_or_create(tag: params[:tag], link_id: link.id)
    link.tags << tag
    link.save
    redirect '/links'
  end

 #  post "/links" do
 #   link = Link.create(url: "#{params[:url]}", title: "#{params[:title]}")
 #   params[:tag].split.each do |tag|
 #     link.tags << Tag.first_or_create(tag: tag)
 #   end
 #   link.save
 #   redirect "/links"
 # end

  get '/links/new' do
    erb :new_links
  end

  get '/tags/:name' do
    tag = Tag.all(tag: params[:name])
     @links = tag ? tag.links : []
     erb(:links)
   end

    run! if app_file == $0
end
