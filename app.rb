require 'sinatra/base'
require './lib/rose'
require './lib/lily'
require './lib/tulip'
require './lib/cart'

class Flowers < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    session[:customer_name] = params[:customer_name]
    redirect '/rose'
  end

  post '/rose' do
    @customer_name = session[:customer_name]
    session[:rose] = Rose.new()
    @rose_input = params[:rose_quantity]
    session[:rose].save_quantity(@rose_input.to_i)
    if session[:rose].saved?
      redirect '/lily'
    else
      erb :rose, :locals => { :message => "That number would not appear to be a bundle of 5s or 10s." } 
    end
  end

  get '/rose' do
    @customer_name = session[:customer_name]
    @rose = session[:rose]
    erb :rose, :locals => { :message => "Enter a quantity of roses in bundles of 5 or 10."}
  end

  post '/lily' do
    session[:lily] = Lily.new()
    @lily_input = params[:lily_quantity]
    session[:lily].save_quantity(@lily_input.to_i)
    if session[:lily].saved?
      redirect '/tulip'
    else
      erb :lily, :locals => { :message => "That number would not appear to be a bundle of 3s, 6s or 9s." }
    end
  end

  get '/lily' do
    erb :lily, :locals => { :message => "Enter a quantity of lilies in bundles of 3s, 6s or 9s." }
  end

  post '/tulip' do
    session[:tulip] = Tulip.new()
    @tulip_input = params[:tulip_quantity]
    session[:tulip].save_quantity(@tulip_input.to_i)
    if session[:tulip].saved?
      redirect '/checkout'
    else
      erb :tulip, :locals => { :message => "That number would not appear to be a bundle of 3s, 5s or 9s." }
    end
  end

  get '/tulip' do
    erb :tulip, :locals => { :message => "Enter a quantity of tulips in bundles of 3s, 5s or 9s." }
  end

  post '/checkout' do
    @tulip = session[:tulip]
    redirect 'checkout'
  end

  get '/checkout' do
    @rose = session[:rose]
    @lily = session[:lily]
    @tulip = session[:tulip]
    @cart = Cart.new()
    erb :checkout
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

end




