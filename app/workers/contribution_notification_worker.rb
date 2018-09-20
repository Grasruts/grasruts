class ContributionNotificationWorker
  include Sidekiq::Worker

  def perform(id)
    ContributionNotificationMailer.notify_admin(id).deliver_now
    ContributionNotificationMailer.notify_donor(id).deliver_now
  end
end
