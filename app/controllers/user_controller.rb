class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :check_current_user, except: [:show]

  def edit
    @user = User.find_by_id params[:id]
  end

  def update
    @user = current_user
    @user.attributes = user_param
    @user.save(context: :kyc)
    unless @user.errors.messages.empty?
      flash[:error] = @user.errors.messages.values.flatten
    end
    redirect_back(fallback_location: root_path)
  end

  def show
    @user = User.find_by_id params[:id]
  end

  def destroy; end

  private

  def check_current_user
    unless current_user.id == params[:id].to_i
      redirect_back(fallback_location: root_path)
    end
  end

  def user_param
    params.require(:user).permit(:name, :email, :country, :city, :address, :contact_number, :pan, :facebook, :twitter, :avatar, :about)
  end
end
