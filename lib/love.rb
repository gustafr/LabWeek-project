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

  get '/admin' do
    redirect 'admin/fill_out'
  end

  get '/admin/fill_out' do
    erb :'admin/fill_out'
  end

  post '/admin/fill_out' do
    begin
      Product.create(brand: params[:brand], product_name: params[:product_name], category: params[:category], barcode: params[:barcode], sugar_content_gram: params[:sugar_content_gram])
      redirect '/admin/product_listing'
    rescue
      redirect 'admin/fill_out'
    end
  end

  get '/admin/product_listing' do
    @product=Product.all
    erb :'admin/product_listing'
  end

  get 'admin/delete/:id' do
    product = Product.get(params[:id])
      product.destroy!
      redirect '/admin/product_listing'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
