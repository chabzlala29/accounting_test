FactoryGirl.define do
  factory :posting do
    account
    transact { create(:transaction) }
    amount { rand(100..10000) }
    status 'withdrawal'
  end
end
