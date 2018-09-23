class CampaignDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def campaign_status
    unless object.status == 'draft'
      days_remaining = (object.published_date.to_date + object.deadline - Date.today).to_i
      return object.status.capitalize if days_remaining == 0
      days_remaining
    end
  end

  def total_contributions
    @contributions = object.contributions.where(state: 'success')
    @total_contributions = @contributions.sum(:amount)
  end
end
