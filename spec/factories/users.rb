FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 4)
    password { password }
    password_confirmation { password }
    last_name { Gimei.name.last.kanji }
    first_name { Gimei.name.first.kanji }
    last_name_kana { Gimei.name.last.katakana }
    first_name_kana { Gimei.name.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
