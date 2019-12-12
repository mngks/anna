class DonationsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      unless @user.donor.nil? || @user.donor.donations.nil?
       @donations = current_user.donor.donations
     end
     unless @user.donations.nil?
       @requests = current_user.donations
     end
     @conversations = (@requests || []) + (@donations || [])
   end
   authorize Donation.new(user: @user)
 end


 def create
  @food = Food.find(params[:food_id])
  @donation = Donation.new
  @donation.food = @donation
  @donation.user = current_user
  authorize @donation
  if @donation.save
    redirect_to food_donation_path(@food, @donation)
  end
end

def update
  @message = Message.new
  @donation = Donation.find(params[:id])
  @message.donation = @donation
  if !@donation.confirmed
    @message.content = "Hi there, I have just accepted your request!"
  else
   @message.content = "Sorry, I have just cancelled your request!"
 end
 @message.user = @donation.food.donor.user
 if @message.save!
  authorize @donation
  @donation.update(confirmed: params[:donation][:confirmed])
  redirect_to donation_messages_path(@donation)
end
end

end
