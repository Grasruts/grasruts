class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :contribution

  enum state: %i[pending success failed]

  after_commit :notify, on: :create

  private

  def notify
    ContributionNotificationWorker.perform_async(id)
  end
end
