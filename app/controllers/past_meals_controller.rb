class PastMealsController < ApplicationController

  def index
    render json: current_user.past_meals.as_json
  end

  def show

  end

  def create
    past_meal = PastMeal.new(name: params[:name], description: params[:description],  na: params[:na], k: params[:k], chole: params[:chole], fatrn: params[:fatrn], fasat: params[:fasat], chocdf: params[:chocdf], fibtg: params[:fibtg], procnt: params[:procnt], vitc: params[:vitc], ca: params[:ca], fe: params[:fe], sugar: params[:sugar], enerc_kcal: params[:enerc_kcal],fat: params[:fat],vita_iu: params[:vita_iu], user_id: current_user.id)
    if past_meal.save
      render json: past_meal.as_json
    else
      render json: {errors: past_meal.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update

  end

  def destroy

  end
end
