module Api::FinancesHelper
  def user_finances_search #传入id为userid的搜索方法
    if params[:bet].nil? && params[:et].nil?
      u_search_all
    elsif !params[:bet].nil? && !params[:et].nil?
      u_search_bytime(params[:id],params[:bet],params[:et])
    elsif !params[:bet].nil? && (params[:et].nil? || params[:et] == Time.now)
      u_search_bybgtime(params[:id],params[:bet])
    elsif params[:bet] == params[:et]
      u_search_byday(params[:bet])
    else
      render 'index'
    end
  end

  def account_finances_search #传入id为accountid的搜索方法
    if params[:bet].nil? && params[:et].nil?
      a_search_all
    elsif !params[:bet].nil? && !params[:et].nil?
      a_search_bytime(params[:id],params[:bet],params[:et])
    elsif !params[:bet].nil? && (params[:et].nil? || params[:et] == Time.now)
      a_search_bybgtime(params[:id],params[:bet])
    elsif params[:bet] == params[:et]
      a_search_byday(params[:bet])
    else
      render 'index'
    end
  end

  def user_finances_count #用户账务统计
    if params[:bet].nil? && params[:et].nil?
      u_finance_countall
    elsif !params[:bet].nil? && !params[:et].nil?
      u_finance_countby_time(params[:id],params[:bet],params[:et])
    else
      render 'index'
    end
  end

  def account_finances_count
    if params[:bet].nil? && params[:et].nil?
      a_finance_countall
    elsif !params[:bet].nil? && !params[:et].nil?
      a_finance_countby_time(params[:id],params[:bet],params[:et])
    else
      render 'index'
    end
  end


private
  def u_finance_countall #用户交易金额统计
    sum = Basic.where("userid = ?",params[:id]).sum("money")
    @sum =sum #总金额
    max = Basic.where("userid = ?",params[:id]).maximum("money")
    @max = max #最大金额
    min = Basic.where("userid = ?",params[:id]).minimum("money")
    @min = min #最小值
  end

  def u_finance_countby_time(uid,bet,et) #某段时间的交易金额统计
    userid = uid
    begintime = bet
    endtime =et
    sum = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,begintime,endtime).sum("money")
    @sum = sum
    max = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,begintime,endtime).maximum("money")
    @max = max
    min = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,begintime,endtime).minimum("money")
    @min = min
    @count = {sumcount:@sum,maxcount:@max,mincount:@min}
  end

  def a_finance_countall #账户交易金额统计
    sum = Basic.where("pay_account = ?",params[:id]).sum("money")
    @sum =sum #总金额
    max = Basic.where("pay_account = ?",params[:id]).maximum("money")
    @max = max #最大金额
    min = Basic.where("pay_account = ?",params[:id]).minimum("money")
    @min = min #最小值
  end

  def a_finance_countby_time(aid,bet,et) #某段时间的交易金额统计
    accountid = aid
    begintime = bet
    endtime =et
    sum = Basic.where("pay_account = ? AND receive_time BETWEEN ? AND ?",accountid,begintime,endtime).sum("money")
    @sum = sum
    max = Basic.where("pay_account = ? AND receive_time BETWEEN ? AND ?",accountid,begintime,endtime).maximum("money")
    @max = max
    min = Basic.where("pay_account = ? AND receive_time BETWEEN ? AND ?",accountid,begintime,endtime).minimum("money")
    @min = min
  end

  def u_search_all #用户关联搜索默认时间降序
    finances = Basic.where("userid = ?",params[:id]).order(receive_time: :desc)
    @finances = finances.limit(10)
  end

  def u_search_bytime(uid,bet,et) #起始时间和终止时间都存在
    #uid = params[:id];bet = params[:bet]; et = params[:et]
    userid = uid
    begintime = bet
    endtime = et
    finances = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,
                           begintime,endtime).order(receive_time: :desc)
    @finances = finances
  end

  def u_search_bybgtime(uid,bet) #只有起始时间
    userid = uid
    begintime = bet
    finances = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,
                           begintime,Time.now).order(receive_time: :desc)
    @finances = finances
  end

  def u_search_byday(bet) #起始时间等于终止时间
    begintime = bet
    finances = Basic.where("userid = ? AND receive_time = ?",params[:id],begintime)
    @finances = finances
  end

  def a_search_all #账户关联搜索默认时间降序
    finances = Basic.where("pay_account = ?",params[:id]).order(receive_time: :desc)
    @finances = finances
  end

  def a_search_bytime(aid,bet,et)
    accountid = aid
    begintime = bet
    endtime = et
    finances Basic.where("pay_account = ? AND receive_time BETWEEN ? AND ?",accountid,
                         begintime,endtime)
    @finances = finances
  end

  def a_search_bybgtime(aid, bet)
    accountid = aid
    begintime = bet
    finances = Basic.where("pay_account = ? AND receive_time BETWEEN ? AND ?",accountid,
                           begintime,Time.now).order(receive_time: :desc)
    @finances = finances
  end

  def a_search_byday(bet)
    begintime =bet
    finances = Basic.where("pay_account = ? AND receive_time = ?",params[:id],begintime)
    @finances = finances
  end

end
