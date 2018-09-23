# frozen_string_literal: true

class Contribution < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  belongs_to :reward, optional: true

  enum state: %i[pending success failed]
  enum gateway: %i[esewa khalti cash_pickup]

  # before_validation :set_uuid, on: :create
  after_commit :notify, on: :update

  private

  def notify
    ContributionNotificationWorker.perform_async(id) unless state.nil?
  end
end
