FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    family1               {'test'}
    name1                 {'test'}
    family2               {'test'}
    name2                 {'test'}
    birth                 {'1900-01-01'}
  end
end