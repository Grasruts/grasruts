# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    name 'Campaign 1'
    uri 'campaign_1'
    about 'about'
    goal 20000
    card_description "abc"
    mode 0
    status 2
    deadline 2
    location 'asdf'
    video 'https://www.youtube.com/watch?v=GrlAInfP990'
    published_date Time.now
    user
    campaign_category
  end
end
