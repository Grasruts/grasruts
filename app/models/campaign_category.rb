class CampaignCategory < ApplicationRecord
  has_many :campaigns, dependent: :destroy
end
