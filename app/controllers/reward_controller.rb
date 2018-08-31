class RewardController < ApplicationController
  before_action :is_owner_of_campaign?

  def new
    @reward = Reward.new
  end

  def create
    @campaign = Campaign.find params[:campaign_id]
    reward_params = reward_param.merge(shipping_date: Date.new(reward_param[:year].to_i, reward_param[:month].to_i).to_time).except(:month, :year)
    @reward = @campaign.rewards.create(reward_params)
    unless @reward.errors.messages.empty?
      flash[:error] = @reward.errors.messages.values.flatten
      return redirect_back(fallback_location: root_path)
    end
    redirect_to campaign_rewards_path(params[:campaign_id], section: 'rewards')
  end

  def edit
    @reward = Campaign.find(params[:campaign_id]).rewards.find(params[:id])
  end

  def update
    @reward = Campaign.find(params[:campaign_id]).rewards.find(params[:id])
    reward_params = reward_param.merge(shipping_date: Date.new(reward_param[:year].to_i, reward_param[:month].to_i).to_time).except(:month, :year)
    @reward.update(reward_params)
    unless @reward.errors.messages.empty?
      flash[:error] = @reward.errors.messages.values.flatten
      return redirect_back(fallback_location: root_path)
    end
    redirect_to campaign_rewards_path(params[:campaign_id], section: 'rewards')
  end

  def destroy
    @reward = Campaign.find(params[:campaign_id]).rewards.find(params[:id])
    @reward.destroy
    redirect_to campaign_rewards_path(params[:campaign_id], section: 'rewards')
  end

  private

  def reward_param
    params.require(:reward).permit(:name, :price, :description, :total_reward, :claimed_reward, :month, :year, :campaign_id, :limited)
  end
end
