class FoodsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @foods = @user.foods
    else
      @foods = Food.all
    end


    @categories = Category.all

    if params[:category_name]
      # get filter from params[:category_name]
      # filter by category
      @foods = @foods.select do |food|
        food.categories.exists?(name: params[:category_name])
      end
    end

    respond_to do |format|
      format.html
        format.js # <-- will render `app/views/foods/index.js.erb`
      end
    end

    def show
      @donation = @food.donations.build
      @donation.user = current_user
      @user = @food.donor.user
    @foods = Food.geocoded # returns food with coordinates

    @markers = @foods.map do |food|
      {
        lat: food.latitude,
        lng: food.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { food: food })
      }
    end
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.donor = current_user.donor
    if @food.save
      redirect_to food_path(@food)
    end

    @category = Category.all

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
