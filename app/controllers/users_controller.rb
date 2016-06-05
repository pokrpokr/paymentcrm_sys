class UsersController < ApplicationController
  skip_before_action :logged_in_user,only: [:new,:create]
  include UsersHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash.now[:success] = "欢迎使用本管理系统"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = "更新成功"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @accounts = @user.accounts
    @orders = @user.orders
  end

  def index
    search_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash.now[:success] = "用户删除成功"
    redirect_to users_url
  end

private
  def user_params
    params.require(:user).permit(:username, :email,:user_type,:real_name,:phone,:idcard, :password,:password_confirmation)
  end
end
