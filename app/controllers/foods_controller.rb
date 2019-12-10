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
    end

  def show
    authorize @food
    @donation = @food.donations.build
    @donation.user = current_user
    @user = @food.donor.user
    #@foods = Food.geocoded # returns food with coordinates

    respond_to do |format|
      format.html
      format.js # <-- will render `app/views/foods/index.js.erb`
    end

    @markers = [@food].map do |food|
      {
        lat: food.latitude,
        lng: food.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { food: food })
      }
    end
  end

  def new
    @food = Food.new
    authorize @food
  end

  def create
    @food = Food.new(food_params)
    authorize @food
    @food.donor = current_user.donor
    if @food.save
      @food.categories = []
      params[:food][:category_ids].each do |category_id|
        @food.categories << Category.find(category_id)
      end
      redirect_to food_path(@food)
    end

    @category = Category.all

  end

  def edit
    authorize @food
  end

  def update
    authorize @food
    if @food.update(food_params)
      @food.categories = []
      params[:food][:category_ids].each do |category_id|
        @food.categories << Category.find(category_id)
      end

      redirect_to @food
    else
      render 'edit'
    end
  end

  def destroy
    authorize @food
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
    params.require(:food).permit(:name, :description, :photo, :purchase_date, :categories, :location)
  end
end
