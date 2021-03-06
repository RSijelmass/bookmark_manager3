ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'init'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
    	@current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

 
  post '/login' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:confirmation])
        if user.valid? 
	  session[:user_id] = user.id
	  redirect('/links') 
	else
	  flash.now[:fail] = 'Password and Confirmation do not match! Try again.'
	  erb :index
	end
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :links
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tags_array = params[:tags].split(',')
    tags_array.each {|name| link.tags << Tag.create(name: name)
      link.save  }
    redirect '/links'
  end

  get ('/links/new') do
    erb :newlink
  end

  get '/tags/:tag' do
    @links = Link.all
    @tag = params['tag']
    erb :select_tags
  end
end
