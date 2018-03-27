require "unirest"

class NutritionalDatasController < ApplicationController
  def index
    n_data = NutritionalDatum.all
    render json: n_data.as_json
  end

  def get_recipe
    app_ID = ENV['APP_ID']
    app_KEY = ENV['API_KEY']
    api_Call = "http://api.yummly.com/v1/api/recipes?_app_id="+app_ID + "&_app_key=" + app_KEY
    api_Call += params[:apiCall].to_s
    response = Unirest.get(api_Call)
    render json: response.body

  end

  def get_recipe_details
    app_ID = ENV['APP_ID']
    app_KEY = ENV['API_KEY']
    api_Call = "http://api.yummly.com/v1/api/recipe/" + params[:id].to_s + "?_app_id=" + app_ID + "&_app_key=" + app_KEY

    response = Unirest.get(api_Call)
    render json: response
  end
end
