require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-migrations'
require 'bcrypt'
require 'byebug'
require './lib/product.rb'

class Love < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions
  register Sinatra::Flash
  set :session_secret, '123321123'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "development"

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/love_#{env}")
  DataMapper.auto_upgrade!
  #DataMapper.auto_migrate!
  DataMapper::Model.raise_on_save_failure = true
  DataMapper.finalize

  get '/' do
    erb :index
  end

  get '/fill_out' do
    erb :fill_out
  end

  post '/fill_out' do
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
