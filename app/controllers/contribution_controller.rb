class ContributionController < ApplicationController
  
  def create
    param = contribution_param.merge(campaign_id: params[:campaign_id])
    @contribution = current_user.contributions.create(param)
    redirect_to edit_campaign_contribution_path(params[:campaign_id], @contribution.id)
  end

  def edit
  end

  private

  def contribution_param
    params.require(:contribution).permit(:amount, :user_id, :reward_id, :campaign_id)
  end
end
