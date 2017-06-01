ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'

class BookmarkManager < Sinatra::Base

  get ('/links') do
    @links = Link.all
    @tags = Tag.all
    erb :links
  end

  post ('/links') do
    Link.create(title: params[:title], url: params[:url])
    Tag.create(name: params[:tags])
    redirect '/links'
  end

  get ('/links/new') do
    erb :newlink
  end
end
