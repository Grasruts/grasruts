# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    name
    uri
    about
    goal
    faq
    card_description
    mode
    status
    deadline
    location
    video
    video_image
    recommended
    video_id
    published_date
    created_at
    updated_at
    discarded_at
    user_id
    card_image_file_name
    card_image_content_type
    card_image_file_size
    card_image_updated_at
    campaign_category_id
    uuid
  end
end
