FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family1               {'名字'}
    name1                 {'名前'}
    family2               {'ミョウジ'}
    name2                 {'ナマエ'}
    birth                 {'1900-01-01'}
  end
end