require 'sinatra/base'
require_relative './models/link.rb'

class BookmarkManager < Sinatra::Base

  get ('/links') do
    @links = Link.all
    erb :links
  end

  post ('/links') do
    Link.create(params[:title],params[:url])
    redirect '/links'
  end

  get ('/links/new') do
    erb :newlink
  end

end
