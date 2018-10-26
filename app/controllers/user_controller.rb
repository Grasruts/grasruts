# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :check_current_user, except: [:show]

  def edit
    @user = User.find_by_uuid! params[:id]
  end

  def update
    @user = current_user
    @user.attributes = user_param
    @user.save(context: :kyc)
    flash[:error] = @user.errors.messages.values.flatten unless @user.errors.messages.empty?
    redirect_back(fallback_location: root_path)
  end

  def show
    @user = User.find_by_uuid! params[:id]
  end

  def backed_campaign
    @user = User.find_by_uuid! params[:id]
    @backed_campaigns = @user.contributions.select('distinct on (campaign_id) *').where(state: 'success')
  end

  private

  def check_current_user
    redirect_back(fallback_location: root_path) unless current_user.uuid == params[:id]
  end

  def user_param
    params.require(:user).permit(:name, :email, :country, :city, :address, :contact_number, :pan, :facebook, :twitter, :avatar, :about)
  end
end
