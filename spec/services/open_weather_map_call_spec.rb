require 'rails_helper'
require 'vcr'
require 'httparty'

describe OpenWeatherMapCall do
  let(:url) { "https://api.openweathermap.org/data/2.5/air_pollution?lat=37.77493&lon=-122.41941" }

  after(:each) do
    VCR.eject_cassette
  end

  context "Successful call to the API" do
    before(:each) do
      VCR.insert_cassette "open_weather_api_pollution_call"
    end

    it "returns a successful response" do
        response = OpenWeatherMapCall.call(url)
        expect(response.code).to eq(200)
    end

    it "returns the air pollution data" do
      response = OpenWeatherMapCall.call(url)
      response = JSON.parse(response.body)
      expect(response).to have_key("list")
      expect(response["list"][0]).to have_key("components")
      expect(response["list"][0]).to have_key("main")
    end
  end


end