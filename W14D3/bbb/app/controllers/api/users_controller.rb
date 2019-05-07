class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      render :json => "Yeah, you did it bro! Nice work!"
    else
      render :json => "Yeah, you failed bro..."
    end

  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
