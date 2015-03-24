class UsersController < ApplicationController

  def index
    if params[:email].present?
      users = User.where(email: params[:email])
      render json: users
    else
      users = User.all
      render json: users
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      sign_in user
      render json: user
    end
  end

  def show
    render json: User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
