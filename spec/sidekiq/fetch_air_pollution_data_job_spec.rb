require 'rails_helper'

describe FetchAirPollutionDataJob do

  let(:locations) { FactoryBot.create(:location) }
  let(:response) { double(:response, code: 200, body: body) }

    it "imports the air pollution data for all locations" do
      VCR.use_cassette "open_weather_api_pollution_call" do
      expect { subject.perform }.to change { AirPollutionData.count }.by(2)
      air_pollution_data_1 = AirPollutionData.first
      air_pollution_data_2 = AirPollutionData.last
      expect(air_pollution_data_1.aqi).to eq(50)
      expect(air_pollution_data_2.aqi).to eq(50)
      end
    end

  context "when the API response is invalid" do

    let(:locations) { FactoryBot.create_list(:location, 2) }
    let(:response) { double(:response, code: 400, body: '{"error": "Invalid request"}') }

    it "logs an error" do
      expect { subject.perform }.to change { AirPollutionData.count }.by(0)
      expect(Rails.logger).to have_received(:error).with("API response is invalid: #{response}")
    end
  end

  context "when the air pollution data is invalid" do

    let(:response) { double(:response, code: 200, body: '{"list": [{"main": {"aqi": nil}}]}') }

    it "logs an error" do
      expect { subject.perform }.to change { AirPollutionData.count }.by(0)
      expect(Rails.logger).to have_received(:error).with("Air pollution data is invalid: #{response}")
    end
  end

  def body
    '{"coord":{"lon":-122.4194,"lat":37.7749},"list":[{"main":{"aqi":50},"components":{"co":196.93,"no":0.11,"no2":0.58,"o3":75.82,"so2":1.24,"pm2_5":3.85,"pm10":6.32,"nh3":0.07},"dt":1689545244}]}'
  end


end