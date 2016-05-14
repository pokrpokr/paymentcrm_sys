class OrderinfosController < ApplicationController

  def index
  end

  def show
    params[:bank_account] = params[:id]
    @account = Account.where("bank_account = ?",params[:bank_account])
    @account.each do |acc|
      params[:id] = acc.user_id
    end
    @user = User.find(params[:id])
    redirect_to @user
  end
end
