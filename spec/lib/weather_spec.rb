require 'weather'

RSpec.describe Weather do

  describe "GET weather" do      
    context "weather object" do      
      it "returns weather" do
        w = Weather.new
        message = w.demo
        expect(message).to eq("demo")
        # expect(last_response.status).to eq 200
      end
    end

    context 'return weather object' do
      it 'has a time field' do
        obj = Weather.getWeather(42.3601,-71.0589)
        expect(obj['timezone']).to eq("America/New_York")
      end
    end 
  end

end
