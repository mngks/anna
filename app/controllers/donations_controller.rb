class DonationsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
     @donations = current_user.donor.donations
     @requests = current_user.donations
      @conversations = @requests + (@donations || [])
   end
  end

  def create
    @food = Food.find(params[:food_id])
    @donation = Donation.new
    @donation.food = @donation
    @donation.user = current_user
    if @donation.save
      redirect_to food_donation_path(@food, @donation)
    end
  end

  def update
    @donation = Donation.find(params[:id])
    @donation.update(confirmed: params[:donation][:confirmed])
    redirect_to donation_messages_path(@donation)
  end

end
