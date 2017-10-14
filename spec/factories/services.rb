FactoryGirl.define do
  factory :service do
    service_name { Faker::Lorem.word }
    owner { Faker::StarWars.character }
    description { Faker::Lorem.paragraph }
    language { Faker::Lorem.word }
  end
end
