class Campaign < ApplicationRecord
  include Discard::Model
  enum mode: [:aon, :flexible]
  enum status: [:draft, :pending, :rejected, :success, :fail]

  has_many :rewards, dependent: :destroy
  has_many :campaign_updates, dependent: :destroy
  has_many :campaign_images, dependent: :destroy
end
