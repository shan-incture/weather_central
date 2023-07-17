FactoryBot.define do
  factory :locations do
    latitude { 1.5 }
    longitude { 1.5 }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
  end
end
