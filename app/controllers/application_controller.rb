class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_required
  	if session[:user_id].nil?
  		redirect_to login_users_path, notice: 'El usuario debe iniciar sesion'
  	end
  end

  def current_user
    if session[:user_id]
      @current_user ||=
          User.find(session[:user_id])
    end
  end
  
end
