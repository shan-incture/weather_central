require 'rails_helper'

describe AirPollutionDataImporter do
  let(:response) { double(:response, code: 200, body: body) }
  let(:location) { create(:location) }

  context "when the API response is valid" do
    it "imports the air pollution data into the database" do
      importer = AirPollutionDataImporter.new(response, location)
      importer.import

      expect(AirPollutionData.count).to eq(1)
      air_pollution_data = AirPollutionData.first
      expect(air_pollution_data.aqi).to eq(50)
    end
  end

  context "when the API response is invalid" do

    let(:response) { double(:response, code: 400, body: '{"error": "Invalid request"}') }
    let(:location) { create(:location) }

    it "raises an error" do
      importer = AirPollutionDataImporter.new(response, location)
      expect { importer.import }.to raise_error(AirPollutionDataImportError)
    end
  end


  private

  def body
   '{"coord":{"lon":-122.4194,"lat":37.7749},"list":[{"main":{"aqi":50},"components":{"co":196.93,"no":0.11,"no2":0.58,"o3":75.82,"so2":1.24,"pm2_5":3.85,"pm10":6.32,"nh3":0.07},"dt":1689545244}]}'
  end

end
