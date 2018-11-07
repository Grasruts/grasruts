# frozen_string_literal: true

class HomeDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def campaign_status
    unless object.status == 'draft'
      days_remaining = (object.published_date.to_date + object.deadline - Date.today).to_i
      return object.status.capitalize if days_remaining < 1

      days_remaining
    end
  end

  def npr_currency_format(amt)
    amt.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")
  end

  def total_contributions
    @contributions = object.contributions.where(state: 'success')
    @total_contributions = @contributions.sum(:amount)
  end

  def occupied_rewards(id)
    object.contributions.where(reward_id: id).size
  end
end
