class Api::SessionController < ApplicationController


  def create

    @user = User.find_by_credentials(session_params[:username], session_params[:password])
    
    if @user
      sign_in(@user)
      render 'api/users/show'
    else
      render :json => ["invalid combo, bro"], status: 401
    end

  end

  def destroy
    
    if signed_in?
      sign_out
      render :json => "success" 
    else
      render :json => "404"
    end

  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

end
