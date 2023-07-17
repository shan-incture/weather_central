require 'rails_helper'

RSpec.describe AirPollutionData, type: :model do
  context "when there is data for one location" do
    let(:location) { create(:location) }
    let(:data_1) { create(:air_pollution_data, location: location, aqi: 50) }
    let(:data_2) { create(:air_pollution_data, location: location, aqi: 50) }

    it "returns the average air quality index for the location" do
      average_aqi = AirPollutionData.average_aqi_per_location
      expect(average_aqi[location.id]).to eq(50)
    end
  end

  context "when there is no data for a location" do
    let(:location) { create(:location) }

    it "returns nil for the location" do
      average_aqi = AirPollutionData.average_aqi_per_location
      expect(average_aqi[location.id]).to be_nil
    end
  end

  context "when there is data for one state" do
    let(:state) { create(:state) }
    let(:location_1) { create(:location, state: state) }
    let(:location_2) { create(:location, state: state) }
    let(:data_1) { create(:air_pollution_data, location: location_1, aqi: 50) }
    let(:data_2) { create(:air_pollution_data, location: location_2, aqi: 50) }

    it "returns the average air quality index for the state" do
      average_aqi = AirPollutionData.average_aqi_per_state
      expect(average_aqi[state.name]).to eq(50)
    end
  end

  context "when there is no data for a state" do
    let(:state) { create(:state) }

    it "returns nil for the state" do
      average_aqi = AirPollutionData.average_aqi_per_state
      expect(average_aqi[state.name]).to be_nil
    end
  end
end