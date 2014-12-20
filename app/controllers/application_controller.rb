class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  after_filter :auto_remove_expired_cookie
  before_filter :auto_detect_user_loggined
  before_filter :check_user_loggedin, :only => [:create, :edit, :update, :destroy]
  protect_from_forgery with: :exception

  private
  def auto_detect_user_loggined
    @loggined_user_id = session[:logined_user_id]
  end

  def auto_remove_expired_cookie
    puts session[:logined_user_id]
  end

  def check_user_loggedin
    if session[:logined_user_id] == nil
      render nothing: true, status: 401
      return
    end

    begin
      User.find(session[:logined_user_id])
    rescue
      render nothing: true, status: 401
    end
  end

  def check_editable(obj)
    if obj.created_user != @loggined_user_id
      render nothing: true, status: 401
    end
  end

  def check_visiable(obj)
    obj.created_user == @loggined_user_id
  end
end
