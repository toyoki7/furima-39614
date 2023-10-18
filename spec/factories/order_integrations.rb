FactoryBot.define do
  factory :order_integration do

    postcode { '123-4567' }
    prefecture_id { '2' }
    municipality { '東松山市' }
    address { '和泉町5-43' }
    building { 'レオパレス' }
    phone { '12345678910' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
