class UserController < ApplicationController

  def edit
    @user = User.find params[:id]
  end

  def update
  end

  def show
  end

  def destroy
  end
end
