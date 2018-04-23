
require 'sinatra'
require 'active_record'
#require 'sinatra/reloader'
require 'pg'
require 'pry'

require_relative 'db_config'
require_relative 'models/group'
require_relative 'models/message'
require_relative 'models/user'

enable :sessions

helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
   current_user
  end
end

get '/' do
  @groups = Group.all
  erb :index
end

get '/group/new' do
  erb :addgroup
end

post '/messages' do
  message = Message.new
  message.group_id = params[:group_id]
  message.content = params[:content]
  message.user_id = current_user.id
  message.save
  redirect to("/groups/#{ params[:group_id] }")
end


post '/groups' do
  group = Group.new
  group.name = params[:name]
  group.city = params[:city]
  group.meeting_point = params[:meeting_point]
  group.day_time = params[:day_time]
  group.contact = params[:contact]
  group.info = params[:info]
  group.photo = params[:photo]
  if group.save
    redirect to('/')
  else
    erb :addgroup
  end
end

get '/groups/:id' do
  @group = Group.find(params[:id])
  @photo = @group.photo
  @city = @group.city
  @meeting_point = @group.meeting_point
  @day_time = @group.day_time
  @contact = @group.contact
  @info = @group.info
  @messages= @group.messages
  erb :grouppage
end

get '/groups/:id/edit' do
  @group = Group.find(params[:id])
  erb :edit
end

put '/groups/:id' do
  group = Group.find( params[:id] )
  group.name = params[:name]
  group.city = params[:city]
  group.meeting_point = params[:meeting_point]
  group.day_time = params[:day_time]
  group.contact = params[:contact]
  group.info = params[:info]
  group.photo = params[:photo]
  group.save
  redirect to("/groups/#{params[:id]}")
end

get '/search' do
  if params["userInput"]
    @search = '%' + params['userInput'] + '%'
    @result = Group.where("name ILIKE '#{@search}'")
  end
  if params["userInputcity"]
    @searchcity = '%' + params['userInputcity'] + '%'
    @resultcity = Group.where("city ILIKE '#{@searchcity}'")
  end
  if params["userInputday"]
    @searchday = '%' + params['userInputday'] + '%'
    @resultday = Group.where("day_time ILIKE '#{@searchday}'")
  end
  erb :search
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new
  @user.user_name = params[:user_name]
  @user.user_email = params[:user_email]
  @user.password = params[:password]
  @user.save
  session[:user_id] = @user.id
    redirect to('/')
  erb :signup
end

get '/login' do
  erb :login
end

post '/session'  do
  user = User.find_by(user_email: params[:user_email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to('/')
  else
    erb :loginfail
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect to('/')
end

delete '/groups' do
  group = Group.delete( params[:id] )
  redirect to('/')
end

get '/about' do
  erb :about
end
