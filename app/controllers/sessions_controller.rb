class SessionsController < ApplicationController
  skip_before_action :logged_in_user,only:[:new,:create]
  def new
  end

  def create
    user = User.where("email = ?",params[:session][:email].downcase).first
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = '邮箱或者密码错误'
      render 'new'
    end

  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
