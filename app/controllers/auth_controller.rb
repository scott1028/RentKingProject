class AuthController < ApplicationController
  def login
  end

  def check_access_token
    user = FbGraph::User.me(params[:accessToken])
    user = user.fetch
    render :json => user
  end

  def logout
  end
end
