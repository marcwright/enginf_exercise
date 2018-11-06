require 'sinatra'
require 'puma'
require 'httparty'

require 'weather'

class App < Sinatra::Application
  get '/' do
    'Hello d'
  end

  get '/fuck-you' do
    'fuck you'
  end

  get '/weather/:lat&:lon' do

    lat = params['lat']
    lon = params['lon']

    # puts lat, lon

    response = HTTParty.get("https://api.darksky.net/forecast/99145f01c4937bdc3536e4375c873d04/#{lat},#{lon}")
    json_response = JSON.parse(response.body)

    puts json_response["latitude"]

    "Hello #{json_response["latitude"]}"
  end
end
