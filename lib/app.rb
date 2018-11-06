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

    response = HTTParty.get("https://api.darksky.net/forecast/99145f01c4937bdc3536e4375c873d04/#{lat},#{lon}?exclude=offset,flags,hourly,minutely,timezone,latitude,longitude,timezone")
    json_response = JSON.parse(response.body).to_json
    currently = json_response['currently']
    # dailyArray = json_response

    dailyArray = response["daily"]["data"]
    newDailyArray = dailyArray.map {|day| 
      { 
        date: day["time"], 
        type: day["icon"],
        description: day["summary"],
        temperature: {
          low: day["temperatureMin"],
          high: day["temperatureMax"]
        }
      } 
    }

    puts newDailyArray
    
    {
      "date": response['currently'],
      "type": response['currently']['icon'],
      "description": response['currently']['summary'],
      "temperature": response['currently']['temperature'],
      "wind": {
        "speed": response['currently']['windSpeed'],
        "bearing": response['currently']['windBearing']
      },
      "precip_prob": response['currently']['precipProbability'],
      "daily": newDailyArray
    }.to_json
  end
end

