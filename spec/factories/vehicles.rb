FactoryGirl.define do
  factory :vehicle do
    year "2017"
    make 'Tesla'
    model 'X'
    stock_number '123456'
    description 'A fast electric vehicle'
    winning_bid 11000
    seller_payout 7000
    auction

    factory :another_vehicle do
      year "2011"
      make 'Toyota'
      model 'Corolla'
      stock_number '13336'
      description 'A reliable sedan'
      winning_bid 5000
      seller_payout 4000
      auction
    end

    factory :no_make_vehicle do
      make nil
    end
  end
end