# frozen_string_literal: true

class CampaignCategory < ApplicationRecord
  has_many :campaigns, dependent: :destroy
end
