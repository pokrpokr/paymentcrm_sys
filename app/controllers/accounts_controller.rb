class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash.now[:success] = "绑定成功"
      redirect_to @account
    else
      render 'new'
    end
  end

  def destroy
    Account.find(params[:id]).destroy
    flash.now[:success] = "解绑账号"
    redirect_to @current_user
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(change_password)
      flash[:success] = "修改成功"
      redirect_to @account
    else
      flash[:danger] = "更新失败"
      render 'edit'
    end
  end

  def edit
    @account = Account.find(params[:id])
  end


  private
  def account_params
    params.require(:account).permit(:user_id, :bank_account, :bank_account_no,:bank_phone,:bank_type,:account_type,:balance,:area,:paypassword,:paypassword_confirmation)
  end

  def change_password
    params.require(:account).permit(:paypassword,:paypassword_confirmation)
  end
end
