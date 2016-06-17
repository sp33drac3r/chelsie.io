class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      render :json => @user
    else
      render :json => {response: 'User authentication failed'}
    end
  end
end
