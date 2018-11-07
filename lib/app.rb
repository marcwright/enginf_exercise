require 'dotenv/load'
require 'sinatra'
require 'puma'
require 'httparty'

require 'weather'

class App < Sinatra::Application
  get '/' do
    'Hello d'
  end

  get '/demo' do
    Weather.demo
  end

  get '/weather/:lat&:lon' do
    
    lat = params['lat']
    lon = params['lon']

    Weather.getWeather(lat, lon)
  end
end

