
class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create

    new_user = User.new(user_params)
    new_user.save!

    if new_user.save!
      render json: new_user
    else
      render json: new_user.errors.full_messages, status: :unprocessable_entity
    end
    
  end

  def show
    user = User.find(params[:id])

    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    
    if user
      # User.update(user.id, user_params)
      user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy

    user = User.find(params[:id])

    if user
      user.destroy
      render json: User.all
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end

  end

  

  private

  def user_params
    params.require(:user).permit(:username)
  end

end