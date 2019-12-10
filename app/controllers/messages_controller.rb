class MessagesController < ApplicationController
  # before_action :find_donation

  def index
    if params[:donation_id]
      @donation = Donation.find(params[:donation_id])
      @food = @donation.food
    else
      @food = Food.find(params[:food_id])
      @donation = Donation.where(food: @food, user: current_user).first_or_create
    end

  @message = Message.new
    @message.user = current_user
    @message.donation = @donation

    requester = @donation.user
    donor = @food.donor.user

    @messages = Message.where(
      user: requester,
      donation: @donation
    ).or(
      Message.where(
        user: donor,
        donation: @donation
      )
    )
  end

  def create
    @donation = Donation.find(params[:donation_id])
    @food = @donation.food

    @message = Message.new(message_params)
    @message.user = current_user
    @message.donation = @donation
    @message.set_user

    if @message.save
      if @donation.food.donor.user == current_user
        redirect_to donation_messages_path(@donation)
      else
        redirect_to food_messages_path(@food)
      end
    end
  end

  def new
    @message = @donation.messages.new
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def find_donation
    @donation = Donation.find(params[:donation_id])
  end
end
