class RequirementsController < ApplicationController
  def index
    requirements = Requirement.all
    render json: requirements.as_json
    # if current_user
    #   render json: current_user.requirements.as_json
    # else
    #   render json: {Error: "No current user"}
    # end
  end
  def show
    if current_user
      render json: current_user.requirements.as_json
    else
      render json: {Error: "No current user"}
    end
  end

  def create
    requirement = Requirement.new(name: params[:name], tag: params[:tag], user_id: params[:user_id])
    if requirement.save
      render json: requirement.as_json
    else
      render json: {errors: requirement.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
