class Campaign < ApplicationRecord
  include Discard::Model
  enum mode {aon: 1, flexible: 2}
  enum status {draft: 1, pending: 2, rejected: 3, success: 4, fail: 5}

  has_many :rewards, dependent: :destroy
  has_many :campaign_updates, dependent: :destroy
  has_many :campaign_images, dependent: :destroy
end
