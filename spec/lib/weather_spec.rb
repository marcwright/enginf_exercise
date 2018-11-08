require 'weather'
require 'httparty'

RSpec.describe Weather do
  before(:example) do
    @weather = Weather.new
    @obj = Weather.apiDarkSkies(42.3601,-71.0589) 
  end

  # describe @obj do
  #   subject { @obj }
  #   expect(it should have_key("wind")).to be true
  # end

  describe "GET weather" do      
    context "weather demo instance method" do      
      it "returns demo String" do
        
        expect(@weather.demo).to eq("demo")
        # expect(last_response.status).to eq 200
      end
    end

    context 'return Dark Skies weather object' do
      it 'is an object' do
        expect(@obj).to be_an(Object)
      end     

      it 'has a timezone field' do 
        expect(@obj.has_key?("wind")).to eq(true)
      end

      it 'fucks yourself' do
        raise
      end
    end 
  end

end
