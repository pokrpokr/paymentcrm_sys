class Api::FinancesController < ApplicationController
  include Api::FinancesHelper
  def show
    @finance = Basic.find(params[:id])
  end

  def index
  end

  def count
    # params[:id] = "2"
    # params[:bet] = "2016-02-15"
    # params[:et]  = "2016-02-20"
    # if user_id
    #   params[:id] =user_id
      # user_finances_count
    #elsif params[:id] = accountid
    #  account_finances_count
    #end
  end

  def search
    #if params[:id] == user_id
    params[:id] = "2"
     user_finances_search
    #elsif params[:id] == account_id
    #account_finances_search
    #end
  end
end
