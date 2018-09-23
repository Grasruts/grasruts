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
    unless state.nil?
      ContributionNotificationWorker.perform_async(id)
    end
  end

end
