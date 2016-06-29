FactoryGirl.define do
  factory :account do
    name { FFaker::Lorem.characters(10) }
    current_balance { rand(1000..10000) }
  end
end
