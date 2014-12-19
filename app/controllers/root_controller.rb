class RootController < ApplicationController
  def index
    @user_id = session[:logined_user_id]
  end
end
