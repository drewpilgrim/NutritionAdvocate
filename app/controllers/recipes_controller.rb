class RecipesController < ApplicationController

  def index
    recipes = current_user.recipes.all
    render json: recipes.as_json
  end

  def show
    recipe = Recipes.find_by(id: params[:id])
    if (contact == nil)
      render json: {Error_Message: "No recipe by that id"}
    else
      render json: recipe.as_json
    end
  end

  def create 
    recipe = Recipe.new(name: params[:name], user_id: current_user.id, yumID: params[:yumID], image_url: params[:image_url])
    if recipe.save
      render json: recipe.as_json
    else
      render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update 
    # contact = Contact.find_by(id: params[:id])
    # if contact.update(
    #     first_name: params[:first_name], 
    #     last_name: params[:last_name]
    #     )
    #   render json: contact.as_json    
    # else
    #   render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity
    # end
  end


  def destroy 
    recipe = Recipe.find_by(id: params[:id])
    if recipe
      recipe.destroy
      render json: {Message: "Destroyed recipe"}
    else
      render json: {Message: "No recipe by that id"}
    end
  end

end
