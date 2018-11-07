require 'httparty'
require 'dotenv/load'

class Weather
  def demo
    "demo"
  end

  def self.getWeather(lat, lon)
    api_key = ENV['DARK_SKIES_API_KEY']

    response = HTTParty.get("https://api.darksky.net/forecast/#{api_key}/#{lat},#{lon}?exclude=offset,flags,hourly,minutely,timezone,latitude,longitude,timezone")
      puts response
      dailyArray = response["daily"]["data"]
      newDailyArray = dailyArray.map {|day| 
        { 
          date: Time.at(day["time"]).strftime("%Y-%m-%d"), 
          type: day["icon"],
          description: day["summary"],
          temperature: {
            low: day["temperatureMin"],
            high: day["temperatureMax"]
          }
        } 
      }
      
      {
        date: Time.at(response['currently']['time']).strftime("%Y-%m-%d"),
        type: response['currently']['icon'],
        description: response['currently']['summary'],
        temperature: response['currently']['temperature'],
        wind: {
          speed: response['currently']['windSpeed'],
          bearing: response['currently']['windBearing']
        },
        precip_prob: response['currently']['precipProbability'],
        daily: newDailyArray
      }.to_json
  end





end
