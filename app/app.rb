ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/init.rb'

class BookmarkManager < Sinatra::Base

  get ('/links') do
    @links = Link.all
    @tags = Tag.all
    erb :links
  end

  post ('/links') do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get ('/links/new') do
    erb :newlink
  end
end
