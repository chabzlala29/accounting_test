FactoryGirl.define do
  factory :transaction do
    comment { FFaker::Lorem.characters(10) }
    date { DateTime.now + rand(1..10).days }
    status 'active'
  end
end
