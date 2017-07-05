class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end


  add_flash_types :danger, :info, :warning, :success
  helper_method :current_user
end
