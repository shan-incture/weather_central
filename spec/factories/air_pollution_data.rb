FactoryBot.define do
  factory :air_pollution_data do
    location_id { 1 }
    aqi { 1 }
    co { 1.5 }
    no { 1.5 }
    no2 { 1.5 }
    o3 { 1.5 }
    so2 { 1.5 }
    pm2_5 { 1.5 }
    pm10 { 1.5 }
    nh3 { 1.5 }
    dt { 1 }
  end
end
