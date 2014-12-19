class AuthController < ApplicationController
  after_action :set_session_logined, only: :check_access_token

  def login
    @loggined_user_id = session[:logined_user_id]
  end

  def check_access_token
    begin
      fb_user = FbGraph::User.me(params[:accessToken])
      fb_user = fb_user.fetch
    rescue
      fb_user = nil
    end

    if fb_user == nil
      render :status => 401
    else
      logger.info fb_user
      @user = User.find_by_username fb_user.identifier
      if @user == nil
        @user = User.new
        @user.username = fb_user.identifier
        @user.save!
        logger.info @user
        render :json => @user, :status => 200
      else
        render :json => fb_user, :status => 200
      end
    end
  end

  def logout
    session[:logined_user_id] = nil
  end

  def check_if_logined
    @loggined_user_id = session[:logined_user_id]
    logger.info @loggined_user_id
    render :json => @loggined_user_id
  end

  private
  def set_session_logined
    session[:logined_user_id] = @user[:id]
    logger.info @user
  end
end
