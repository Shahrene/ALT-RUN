
require 'sinatra'
require 'activerecord'

require_relative 'db_config'

get '/' do
  erb :index
end
