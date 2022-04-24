FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
