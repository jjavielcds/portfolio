# frozen_string_literal: true

FactoryBot.define do
  factory :investment do
    association :user
    name { Faker::Name.name }
    kind { Investment.kinds.keys.sample }
    coin { Investment.coins.keys.sample }
    initial_value { Faker::Number.decimal }
    start_date { Faker::Date.in_date_period }
  end
end
