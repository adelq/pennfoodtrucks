class FavoritesController < ApplicationController
  before_action :set_ft

  def create
    if Favorite.create(food_truck: @food_truck, user: current_user)
      redirect_to @food_truck, notice: 'Food truck has been favorited'
    else
      redirect_to @food_truck, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(food_truck_id: @food_truck.id, user_id: current_user.id).first.destroy
    redirect_to @food_truck, notice: 'Project is no longer in favorites'
  end

  private

  def set_ft
    @food_truck = FoodTruck.find(params[:food_truck_id] || params[:id])
  end
end
