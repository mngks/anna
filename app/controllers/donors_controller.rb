class DonorsController < ApplicationController
  def new
      @donor = Donor.new
      authorize @donor
    if current_user.donor
      redirect_to new_food_path
    else
      @donor.user = current_user
    end
  end

  def create
    @donor = Donor.new(donor_params)
    @donor.user = current_user
    authorize @donor

    if @donor.save
      redirect_to new_food_path
    end
  end

  private

  def donor_params
    params.require(:donor).permit(:full_name, :contact_number)
  end
end
