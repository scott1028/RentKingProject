class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  after_filter :auto_remove_expired_cookie
  before_filter :auto_detect_user_loggined
  protect_from_forgery with: :exception

  private
  def auto_detect_user_loggined
    @loggined_user_id = session[:logined_user_id]
  end

  def auto_remove_expired_cookie
    puts session[:logined_user_id]
  end
end
