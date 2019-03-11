class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      flash.now[:login_success] = "Hooray, you made a new user!"
      redirect_to user_url(@user.id)
    else
      flash.now[:login_success] = @user.errors.full_messages  
      render :new
    end
    
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end
  

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end