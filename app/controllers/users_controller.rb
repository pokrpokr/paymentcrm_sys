class UsersController < ApplicationController
  include UsersHelper
  def new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新成功"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @accounts = @user.accounts
    @orders = @user.orders
    @finances = @user.basics
  end

  def index
    search_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password,:password_confirmation)
  end
end
