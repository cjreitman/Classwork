class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?, :log_in_user!


  private

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?

    !!current_user

    # @user = current_user
    # debugger
    # return @user.session_token == session[:session_token]
  end

  def log_in_user!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end


end
