class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def get_current_user
    User.find_by_id(session[:user_id])
  end
  
end
