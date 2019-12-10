class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @upcoming_taking = @user.donations.where(confirmed: true)
    if @user.donor
      @upcoming_sharing = @user.donor.donations.where(confirmed: true)
    end
    @events = @upcoming_sharing + (@upcoming_taking || [])
  end

  def edit
  end

  def update
    @user.pickup_days = params[:user][:pickup_days]
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:preferred_start_time, :preferred_end_time, :bio)
  end
end
