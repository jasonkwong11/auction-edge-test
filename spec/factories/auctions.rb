FactoryGirl.define do
  factory :auction do
    name 'Hot Rod Auctions'
    street_address '123 Fake Street'
    city 'Seattle'
    state 'WA'
    zip '98101'

    factory :unnamed_auction do
      name nil
    end
  end
end
