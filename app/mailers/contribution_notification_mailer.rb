class ContributionNotificationMailer < ApplicationMailer

  def notify_admin(id)
    @payment = Payment.find id
    mail(to: 'admin@gmail.com', subject: 'Grasruts: Campaign Contribution Notification')
  end

  def notify_donor(id)
    @payment = Payment.find id
    mail(to: @payment.user.email, subject: "Grasruts: #{@payment.contribution.campaign.name} Contribution Notification")
  end
end
