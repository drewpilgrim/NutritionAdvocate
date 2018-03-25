class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.as_json
  end

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      age: params[:age],
      gender: params[:gender]
      )
    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def logged_in
    if current_user
      render json: {current_user: current_user.as_json}
    else
      return nil
    end
  end

  def is_admin
    admin = current_user.admin
    render json: {admin: "#{admin}"}
  end



end
