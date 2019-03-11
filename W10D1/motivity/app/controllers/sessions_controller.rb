class SessionsController < ApplicationController

  def new 

  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    # debugger
    if @user
      log_in(@user)
      redirect_to users_url
    else
      flash.now[:errors] = ["Invalid login credentials"]
      render :new 
    end
  end
  
  def destroy 
    signout
  end

end
