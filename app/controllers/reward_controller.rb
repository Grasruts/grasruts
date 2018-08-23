class RewardController < ApplicationController
  def index
    @rewards = Campaign.find(params[:campaign_id]).rewards
  end

  def new
    @reward = Reward.new
  end

  def create
    @campaign = Campaign.find params[:campaign_id]
    @reward = @campaign.rewards.create(reward_param)
    redirect_to campaign_reward_index_path params[:campaign_id]
  end

  def edit
    @reward = Campaign.find(params[:campaign_id]).rewards.find(params[:id])
  end

  def update
    @reward = Campaign.find(params[:campaign_id]).rewards.find(params[:id])
    @reward.update(reward_param)
    redirect_to campaign_reward_index_path params[:campaign_id]
  end

  def destroy
    @reward = Campaign.find(params[:campaign_id]).rewards.find(params[:id])
    @reward.destroy
  end

  private
  def reward_param
    params.require(:reward).permit(:name, :price, :description, :total_reward, :claimed_reward, :shipping_date, :campaign_id)
  end
end
