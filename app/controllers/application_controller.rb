class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_owner_of_campaign?(id)
    current_user.campaigns.find(id)
    return true
  rescue ActiveRecord::RecordNotFound
    return false
  end
end
