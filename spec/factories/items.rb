FactoryBot.define do
  factory :item do
    association :user

    item {'aaaaaa'}
    explanation {'ああああああ'}
    category_id { '2' }
    condition_id { '2' }
    burden_id { '2' }
    prefecture_id { '2' }
    until_id { '2' }
    price { '300' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
