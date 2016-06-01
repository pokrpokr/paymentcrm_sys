class FinancesController < ApplicationController
  DATEREG= /^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$/
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  include ApplicationHelper
  def index
  end

  def show
  end

  def u_search
    if !params[:bet].nil? && params[:bet]!= ""
      if params[:bet] =~ DATEREG
        bet = params[:bet]
      else
        params[:bet] = Date.strptime(params[:bet], "%m/%d/%Y")
        bet = params[:bet]
      end
    else
      bet = nil
    end
    if !params[:et].nil? && params[:et]!= ""
      if params[:et] =~ DATEREG
        et = params[:et]
      else
        params[:et] = Date.strptime(params[:et], "%m/%d/%Y")
        et = params[:et]
      end
    else
      et = nil
    end
    if params[:email] =~ EMAIL_REGEX
      user = User.where("email = ?",params[:email]).first
      if user.present?
        params[:id] = user.id
      end
    end
    if params[:id] == session[:user_id]
      userid = session[:user_id]
    else
      userid = params[:id]
    end

    if bet == "" && et != ""
      flash.now[:danger] = "起始时间不能为空"
      render 'u_search'
    elsif !et.nil? && et != "" && et > Time.now
      flash.now[:danger] = "结束时间不能是未来时间"
    elsif !bet.nil? && bet != "" && bet > Time.now
      flash.now[:danger] = "起始时间不能是未来时间"
    else
      params[:id] = userid
      params[:bet] = bet
      params[:et] = et
      user_finances_search
      user_finances_count
    end

  end

  def a_search
    if !params[:bet].nil? && params[:bet]!= ""
      if params[:bet] =~ DATEREG
        bet = params[:bet]
      else
        params[:bet] = Date.strptime(params[:bet], "%m/%d/%Y")
        bet = params[:bet]
      end
    else
      bet = ""
    end
    if !params[:et].nil? && params[:et]!= ""
      if params[:et] =~ DATEREG
        et = params[:et]
      else
        params[:et] = Date.strptime(params[:et], "%m/%d/%Y")
        et = params[:et]
      end
    else
      et = ""
    end

    if bet == "" && et != ""
      flash.now[:danger] = "起始时间不能为空"
      render 'u_search'
    elsif et != "" && et > Time.now
      flash.now[:danger] = "结束时间不能是未来时间"
    elsif bet != "" && bet > Time.now
      flash.now[:danger] = "起始时间不能是未来时间"
    else
      params[:bet] = bet
      params[:et] = et
      account_finances_search
      account_finances_count
    end
  end
end
