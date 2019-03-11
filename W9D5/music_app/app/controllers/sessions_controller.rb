class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    
    @user = User.find_by_credentials(session_params[:email], session_params[:password])
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      flash[:login_status] = 'login success!'
      # debugger
      redirect_to user_url(@user)
    else
      flash.now[:login_status] = "Invalid password/email combination."
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    flash[:login_status] = 'log out successful'
    redirect_to new_session_url
  end
  
  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end