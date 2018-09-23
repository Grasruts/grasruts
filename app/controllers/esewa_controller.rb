class EsewaController < ApplicationController
  before_action :authenticate_user!


  def create
  end

  def success
    pid = params[:oid]
    amt = params[:amt]
    rid = params[:refId]
    uri = URI.parse(ENV['ESEWA_VERIFICATION_URL'])
    uri.query = URI.encode_www_form({amt: amt, scd: ENV['ESEWA_SERVICE_CODE'], pid: pid, rid: rid})
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    # https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    resp = https.get(uri.request_uri)
    if Nokogiri::XML(resp.body).text.strip == "Success"
      contribution = Contribution.find_by_uuid params[:contribution_id]
      contribution.gateway = Contribution.gateways['esewa']
      contribution.ref_id = SecureRandom.uuid,
      contribution.state = Contribution.states['success']
      contribution.save
      redirect_to campaign_contribution_payment_success_path(params[:campaign_id], params[:contribution_id])
    else
    end
  end

  def failure
    campaign = Campaign.find_by_uuid params[:campaign_id]
    redirect_to project_by_slug_path campaign.uri
  end
end
