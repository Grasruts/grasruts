# frozen_string_literal: true

class CampaignUpdate < ApplicationRecord
  belongs_to :campaign
  include Discard::Model

  validates :name, presence: { message: 'Name is required' }
  validates :description, presence: { message: 'Description is required' }
end
