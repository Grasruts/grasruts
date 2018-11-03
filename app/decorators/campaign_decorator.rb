# frozen_string_literal: true

class CampaignDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def campaign_status
    unless object.status == 'draft'
      days_remaining = (object.published_date.to_date + object.deadline - Date.today).to_i
      return object.status.capitalize if days_remaining < 1

      days_remaining
    end
  end

  def total_contributions
    @contributions = object.contributions.where(state: 'success')
    @total_contributions = @contributions.sum(:amount)
  end

  def occupied_rewards(id)
    object.contributions.where(state: 1).where(reward_id: id).size
  end

  def limited_reward_left?(reward)
    reward.limited && (occupied_rewards(reward.id) < reward.total_reward)
  end
end
