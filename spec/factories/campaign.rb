# frozen_string_literal: true

FactoryBot.define do
  factory :draft_campaign, class: Campaign do
    name { 'Campaign 1' }
    uri { 'campaign_1' }
    about { 'about' }
    goal { 20000 }
    card_description { "abc" }
    mode { 0 }
    status { 0 }
    deadline { 2 }
    location { 'asdf' }
    video { 'https://www.youtube.com/watch?v=GrlAInfP990' }
    published_date { Time.now }
    card_image_file_name { 'image.png' }
    # card_image_content_type { 'application/pdf' }
    card_image_file_size { 1024 }
  end

  factory :pending_campaign, class: Campaign do
    name { 'Campaign 12' }
    uri { 'campaign_2' }
    about { 'about' }
    goal { 20000 }
    card_description { "abc" }
    mode { 0 }
    status { 1 }
    deadline { 2 }
    location { 'asdf' }
    video { 'https://www.youtube.com/watch?v=GrlAInfP990' }
    published_date { Time.now }
    card_image_file_name { 'image.png' }
    # card_image_content_type { 'application/pdf' }
    card_image_file_size { 1024 }
  end

  factory :online_campaign, class: Campaign do
    name { 'Campaign 3' }
    uri { 'campaign_3' }
    about { 'about' }
    goal { 20000 }
    card_description { "abc" }
    mode { 0 }
    status { 2 }
    deadline { 2 }
    location { 'asdf' }
    video { 'https://www.youtube.com/watch?v=GrlAInfP990' }
    published_date { Time.now }
    card_image_file_name { 'image.png' }
    # card_image_content_type { 'application/pdf' }
    card_image_file_size { 1024 }
  end

  factory :rejected_campaign, class: Campaign do
    name { 'Campaign 4' }
    uri { 'campaign_4' }
    about { 'about' }
    goal { 20000 }
    card_description { "abc" }
    mode { 0 }
    status { 3 }
    deadline { 2 }
    location { 'asdf' }
    video { 'https://www.youtube.com/watch?v=GrlAInfP990' }
    published_date { Time.now }
    card_image_file_name { 'image.png' }
    # card_image_content_type { 'application/pdf' }
    card_image_file_size { 1024 }
  end

  factory :success_campaign, class: Campaign do
    name { 'Campaign 5' }
    uri { 'campaign_5' }
    about { 'about' }
    goal { 20000 }
    card_description { "abc" }
    mode { 0 }
    status { 4 }
    deadline { 2 }
    location { 'asdf' }
    video { 'https://www.youtube.com/watch?v=GrlAInfP990' }
    published_date { Time.now }
    card_image_file_name { 'image.png' }
    # card_image_content_type { 'application/pdf' }
    card_image_file_size { 1024 }
  end

  factory :failed_campaign, class: Campaign do
    name { 'Campaign 6' }
    uri { 'campaign_6' }
    about { 'about' }
    goal { 20000 }
    card_description { "abc" }
    mode { 0 }
    status { 5 }
    deadline { 2 }
    location { 'asdf' }
    video { 'https://www.youtube.com/watch?v=GrlAInfP990' }
    published_date { Time.now }
    card_image_file_name { 'image.png' }
    # card_image_content_type { 'application/pdf' }
    card_image_file_size { 1024 }
  end
end
