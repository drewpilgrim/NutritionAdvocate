class NutritionalDatasController < ApplicationController
  def index
    n_data = NutritionalDatum.all
    render json: n_data.as_json
  end
end
