class ReviewsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @reviews = Review.where(reviewed_user_id: @user.id)
    else
      @reviews = Review.all
    end
  end

  def new
    @donation = Donation.find(params[:donation_id])
    @review = Review.new(donation: @donation)
    authorize @review
  end

  def create
    @donation = Donation.find(params[:donation_id])
    @review = Review.new(review_params)
    @review.donation = @donation
    @review.user = current_user
    authorize @review
    # if current_user == @donation.user
    #   @review.user = @donation.donor.user
    # else
    #   @review.user = @donation.user
    # end
    if @review.save
      redirect_to user_path(current_user)
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
