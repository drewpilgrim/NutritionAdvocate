class UserRequirementsController < ApplicationController

    def create
    user_r = UserRequirement.new(user_id: params[:user_id], requirement_id: params[:requirement_id])
    if user_r.save
      render json: user_r.as_json
    else
      render json: {errors: user_r.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
