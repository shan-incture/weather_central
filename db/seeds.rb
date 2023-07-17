locations = [
  {
    city: 'Mumbai',
    state: 'Maharashtra',
    country: 'India',
    latitude: 19.0760,
    longitude: 72.8777
  },
  {
    city: 'Delhi',
    state: 'Delhi',
    country: 'India',
    latitude: 28.6139,
    longitude: 77.2293
  },
  {
    city: 'Bangalore',
    state: 'Karnataka',
    country: 'India',
    latitude: 12.9716,
    longitude: 77.5946
  },
  {
    city: 'Hyderabad',
    state: 'Telangana',
    country: 'India',
    latitude: 17.3850,
    longitude: 78.4869
  },
  {
    city: 'Chennai',
    state: 'Tamil Nadu',
    country: 'India',
    latitude: 13.0827,
    longitude: 80.2707
  },
  {
    city: 'Kolkata',
    state: 'West Bengal',
    country: 'India',
    latitude: 22.5625,
    longitude: 88.3639
  },
  {
    city: 'Ahmedabad',
    state: 'Gujarat',
    country: 'India',
    latitude: 23.0225,
    longitude: 72.5726
  },
  {
    city: 'Pune',
    state: 'Maharashtra',
    country: 'India',
    latitude: 18.5204,
    longitude: 73.8567
  },
  {
    city: 'Surat',
    state: 'Gujarat',
    country: 'India',
    latitude: 21.1611,
    longitude: 72.8569
  },
  {
    city: 'Jaipur',
    state: 'Rajasthan',
    country: 'India',
    latitude: 26.9124,
    longitude: 75.7870
  },
  {
    city: 'Lucknow',
    state: 'Uttar Pradesh',
    country: 'India',
    latitude: 26.8467,
    longitude: 80.9462
  },
  {
    city: 'Kanpur',
    state: 'Uttar Pradesh',
    country: 'India',
    latitude: 26.8467,
    longitude: 80.9462
  },
  {
    city: 'Nagpur',
    state: 'Maharashtra',
    country: 'India',
    latitude: 21.1455,
    longitude: 79.0882
  },
  {
    city: 'Indore',
    state: 'Madhya Pradesh',
    country: 'India',
    latitude: 22.7180,
    longitude: 75.8586
  },
  {
    city: 'Visakhapatnam',
    state: 'Andhra Pradesh',
    country: 'India',
    latitude: 17.6827,
    longitude: 83.2320
  },
  {
    city: 'Patna',
    state: 'Bihar',
    country: 'India',
    latitude: 25.6180,
    longitude: 85.1086
  },
  {
    city: 'Bhopal',
    state: 'Madhya Pradesh',
    country: 'India',
    latitude: 23.2587,
    longitude: 77.4128
  },
  {
    city: 'Agra',
    state: 'Uttar Pradesh',
    country: 'India',
    latitude: 27.1762,
    longitude: 78.0422
  },
  {
    city: 'Coimbatore',
    state: 'Tamil Nadu',
    country: 'India',
    latitude: 11.0067,
    longitude: 76.9563
  },
  {
    city: 'Kochi',
    state: 'Kerala',
    country: 'India',
    latitude: 9.9372,
    longitude: 76.2711
  },
  {
    city: 'Thiruvananthapuram',
    state: 'Kerala',
    country: 'India',
    latitude: 8.5293,
    longitude: 76.9312
  }
]

locations.each do |location|
  Location.create(location)
end
