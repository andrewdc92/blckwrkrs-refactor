class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.image_url = ""
      @user.image_url = "http://i.imgur.com/mjrYMQe.png"
    end
    if @user.save
      login(@user)
      render '/api/users/show'
    else
      render json: @user.errors.full_message, status: 422
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user.User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      render '/api/users/show'
    else
      render json: @user.errors.full_message, status: 422
  end

  private

 def user_params
   params.require(:user).permit(:username, :password, :image_url)
 end


end
