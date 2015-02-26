class RantsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    render json: @user.rants.all
  end

  def show
    @user = User.find(params[:user_id])
    @rant = @user.rants(params[:id])
    render json: @rant
  end

  def update
    @user = User.find(params[:user_id])
    @rant = @user.rants.find(params[:id])
    if @rant.update(rant_params)
      render json: @rant
    else
      render json: @user.rants.all
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @rant = @user.rants.find(params[:id])
    @rant.destroy
    render json: @user.rants.all
  end

private

  def rant_params
    params.require(:rant).permit(:title, :body, :user_id)
  end

end