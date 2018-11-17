# frozen_string_literal: true

class EsewaController < ApplicationController
  before_action :authenticate_user!

  def create; end

  def success
    resp = Esewa::Payment::Verification.verify({
      pid: params[:oid],
      amt: params[:amt],
      rid: params[:refId]
    })
    if Nokogiri::XML(resp.body).text.strip == 'Success'
      contribution = Contribution.find_by_uuid params[:contribution_id]
      contribution.gateway = Contribution.gateways['esewa']
      contribution.ref_id = SecureRandom.uuid
      contribution.state = Contribution.states['success']
      contribution.save
      redirect_to campaign_contribution_payment_success_path(params[:campaign_id], params[:contribution_id])
    end
  end

  def failure
    campaign = Campaign.find_by_uuid! params[:campaign_id]
    redirect_to project_by_slug_path campaign.uri
  end
end
