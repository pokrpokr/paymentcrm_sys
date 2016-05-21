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
      flash[:success] = "绑定成功"
      redirect_to @account
    else
      render 'new'
    end
  end

  def destroy
    Account.find(params[:id]).destroy
    flash[:success] = "解绑账号"
    redirect_to @current_user
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(account_params)
      flash[:success] = "更新成功"
      redirect_to @account
    else
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
end
