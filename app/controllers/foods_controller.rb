class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    @foods = Food.all
  end

  def show
    @donation = @food.donations.build
    @donation.user = current_user
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(pet_params)
    @food.donor = current_user.donor
      if @food.save
      redirect_to food_path(@food)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Your food item was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :photo, :purchase_date, :category, :location)
  end
end
