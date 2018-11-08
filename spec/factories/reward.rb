# frozen_string_literal: true

FactoryBot.define do
  factory :reward do
    name { 'reward 1' }
    price { 100 }
    description { "description" }
    shipping_date { Time.now + 10 }
  end

  factory :limited_reward, class: Reward do
    name { 'reward 2' }
    price { 100 }
    description { "description" }
    shipping_date { Time.now + 10 }
    total_reward { 2 }
    limited { 1 }
  end
end
