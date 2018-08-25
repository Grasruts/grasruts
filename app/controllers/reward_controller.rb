class RewardController < ApplicationController

  before_action :is_owner_of_campaign?

  def new
    @reward = Reward.new
  end

  def create
    @campaign = Campaign.find params[:campaign_id]
    @reward = @campaign.rewards.create(reward_param)
    redirect_to campaign_rewards_path(params[:campaign_id], section: 'rewards')
  end

  def edit
    @reward = Campaign.find(params[:campaign_id]).rewards.find(params[:id])
  end

  def update
    @reward = Campaign.find(params[:campaign_id]).rewards.find(params[:id])
    @reward.update(reward_param)
    redirect_to campaign_rewards_path(params[:campaign_id], section: 'rewards')
  end

  def destroy
    @reward = Campaign.find(params[:campaign_id]).rewards.find(params[:id])
    @reward.destroy
    redirect_to campaign_rewards_path(params[:campaign_id], section: 'rewards')
  end

  private
  def reward_param
    params.require(:reward).permit(:name, :price, :description, :total_reward, :claimed_reward, :shipping_date, :campaign_id)
  end
end
