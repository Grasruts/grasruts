class HomePickupController < ApplicationController
  before_action :authenticate_user!


  def create
    contribution = Contribution.find_by_uuid params[:contribution_id]
    payment = contribution.payments.new
    payment.amount = contribution.amount
    payment.ref_id = SecureRandom.uuid
    payment.user_id = current_user.id
    payment.state = Payment.states['pending']
    payment.save!
    redirect_to campaign_contribution_payment_success_path(params[:campaign_id], params[:contribution_id])
  end

  def update
  end
end
