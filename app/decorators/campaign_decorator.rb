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
    days_remaining = (object.published_date.to_date + 60 - Date.today).to_i
    if days_remaining == 0
      return object.status.capitalize
    end
    days_remaining
  end

end
