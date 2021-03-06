module ApplicationHelper
  def user_finances_search #传入id为userid的搜索方法
    if params[:bet].nil? && params[:et].nil?
      u_search_all
    elsif !params[:bet].nil? && !params[:et].nil?
      u_search_bytime(params[:id],params[:bet],params[:et])
    elsif !params[:bet].nil? && params[:et].nil?
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
    elsif !params[:bet].nil? && params[:et].nil?
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
    end
  end

  def account_finances_count
    if params[:bet].nil? && params[:et].nil?
      a_finance_countall
    elsif !params[:bet].nil? && !params[:et].nil?
      a_finance_countby_time(params[:id],params[:bet],params[:et])
    end
  end

  def u_finance_countall #用户交易金额统计
    sum = Basic.where("userid = ?",params[:id]).sum("money")
    @sum =sum #总金额
    max = Basic.where("userid = ?",params[:id]).maximum("money")
    @max = max #最大金额
    min = Basic.where("userid = ?",params[:id]).minimum("money")
    @min = min #最小值
    @pay = Basic.where("userid = ?",params[:id])
    @rec = Basic.where("tousername = ?",params[:id])
    @pay_money = @pay.map { |f| f.money.to_f }
    @rec_money = @rec.map { |f| f.money.to_f }
    @time = @pay.map { |f| f.receive_time.strftime("%Y%m%d").to_i }
    recsum = Basic.where("tousername = ?",params[:id]).sum("money")
    if recsum
      @recsum = recsum #收入总金额
    end
    recmax = Basic.where("tousername = ?",params[:id]).maximum("money")
    if recmax
      @recmax = recmax #收入最大金额
    end
    recmin = Basic.where("tousername = ?",params[:id]).minimum("money")
    if recmin
      @recmin = recmin #收入最小金额
    end
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
    @pay = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,begintime,endtime)
    @rec = Basic.where("tousername = ? AND receive_time BETWEEN ? AND ?",userid,begintime,endtime)
    @pay_money = @pay.map { |f| f.money.to_f }
    @rec_money = @rec.map { |f| f.money.to_f }
    @time = @pay.map { |f| f.receive_time.strftime("%Y%m%d").to_i }
    recsum = Basic.where("tousername = ? AND receive_time BETWEEN ? AND ?",userid,begintime,endtime).sum("money")
    if recsum
      @recsum = recsum
    end
    recmax = Basic.where("tousername = ? AND receive_time BETWEEN ? AND ?",userid,begintime,endtime).maximum("money")
    if recmax
      @recmax = recmax
    end
    recmin = Basic.where("tousername = ? AND receive_time BETWEEN ? AND ?",userid,begintime,endtime).minimum("money")
    if recmin
      @recmin = recmin
    end
  end

  def a_finance_countall #账户交易金额统计
    sum = Basic.where("pay_account = ?",params[:id]).sum("money")
    @sum = sum #总金额
    max = Basic.where("pay_account = ?",params[:id]).maximum("money")
    @max = max #最大金额
    min = Basic.where("pay_account = ?",params[:id]).minimum("money")
    @min = min #最小值
    @pay = Basic.where("pay_account = ?",params[:id])
    @rec = Basic.where("to_bank_account = ?",Account.find(params[:id]).bank_account)
    @pay_money = @pay.map { |f| f.money.to_f }
    @rec_money = @rec.map { |f| f.money.to_f }
    @time = @pay.map { |f| f.receive_time.strftime("%Y%m%d").to_i }
    @rec_time = @rec.map { |f| f.receive_time.strftime("%Y%m%d").to_i }
    recsum = Basic.where("to_bank_account = ?",Account.find(params[:id]).bank_account).sum("money")
    if recsum
      @recsum = recsum #收入总金额
    end
    recmax = Basic.where("to_bank_account = ?",Account.find(params[:id]).bank_account).maximum("money")
    if recmax
      @recmax = recmax #收入最大金额
    end
    recmin = Basic.where("to_bank_account = ?",Account.find(params[:id]).bank_account).minimum("money")
    if recmin
      @recmin = recmin #收入最小金额
    end
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
    @pay = Basic.where("pay_account = ? AND receive_time BETWEEN ? AND ?",accountid,begintime,endtime)
    @rec = Basic.where("to_bank_account = ? AND receive_time BETWEEN ? AND ?",Account.find(accountid).bank_account,begintime,endtime)
    @pay_money = @pay.map { |f| f.money.to_f }
    @rec_money = @rec.map { |f| f.money.to_f }
    @time = @pay.map { |f| f.receive_time.strftime("%Y%m%d").to_i }
    recsum = Basic.where("to_bank_account = ? AND receive_time BETWEEN ? AND ?",Account.find(accountid).bank_account,begintime,endtime).sum("money")
    if recsum
      @recsum = recsum #收入总金额
    end
    recmax = Basic.where("to_bank_account = ? AND receive_time BETWEEN ? AND ?",Account.find(accountid).bank_account,begintime,endtime).maximum("money")
    if recmax
      @recmax = recmax #收入最大金额
    end
    recmin = Basic.where("to_bank_account = ? AND receive_time BETWEEN ? AND ?",Account.find(accountid).bank_account,begintime,endtime).minimum("money")
    if recmin
      @recmin = recmin #收入最小金额
    end
  end

  def u_search_all #用户关联搜索默认时间降序
    finances = Basic.where("userid = ?",params[:id]).order(receive_time: :desc)
    @finances = finances.paginate(page:params[:page]).per_page(6)
  end

  def u_search_bytime(uid,bet,et) #起始时间和终止时间都存在
    #uid = params[:id];bet = params[:bet]; et = params[:et]
    userid = uid
    begintime = bet
    endtime = et
    finances = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,
                           begintime,endtime).order(receive_time: :desc)
    @finances = finances.paginate(page:params[:page]).per_page(6)
  end

  def u_search_bybgtime(uid,bet) #只有起始时间
    userid = uid
    begintime = bet
    finances = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,
                           begintime,Time.now).order(receive_time: :desc)
    @finances = finances.paginate(page:params[:page]).per_page(6)

    sum = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,begintime,Time.now).sum("money")
    @sum = sum
    max = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,begintime,Time.now).maximum("money")
    @max = max
    min = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,begintime,Time.now).minimum("money")
    @min = min
    @pay = Basic.where("userid = ? AND receive_time BETWEEN ? AND ?",userid,begintime,Time.now)
    @rec = Basic.where("tousername = ? AND receive_time BETWEEN ? AND ?",userid,begintime,Time.now)
    @pay_money = @pay.map { |f| f.money.to_f }
    @rec_money = @rec.map { |f| f.money.to_f }
    @time = @pay.map { |f| f.receive_time.strftime("%Y%m%d").to_i }
    recsum = Basic.where("tousername = ? AND receive_time BETWEEN ? AND ?",userid,begintime,Time.now).sum("money")
    if recsum
      @recsum = recsum
    end
    recmax = Basic.where("tousername = ? AND receive_time BETWEEN ? AND ?",userid,begintime,Time.now).maximum("money")
    if recmax
      @recmax = recmax
    end
    recmin = Basic.where("tousername = ? AND receive_time BETWEEN ? AND ?",userid,begintime,Time.now).minimum("money")
    if recmin
      @recmin = recmin
    end
  end

  def u_search_byday(bet) #起始时间等于终止时间
    begintime = bet
    finances = Basic.where("userid = ? AND receive_time = ?",params[:id],begintime)
    @finances = finances.paginate(page:params[:page]).per_page(6)
  end

  def a_search_all #账户关联搜索默认时间降序
    finances = Basic.where("pay_account = ?",params[:id]).order(receive_time: :desc)
    if finances.empty?
      finances = Basic.where("to_bank_account = ?",Account.find(params[:id]).bank_account).order(receive_time: :desc)
    end
    @finances = finances.paginate(page:params[:page]).per_page(6)
  end

  def a_search_bytime(aid,bet,et)
    accountid = aid
    begintime = bet
    endtime = et
    finances = Basic.where("pay_account = ? AND receive_time BETWEEN ? AND ?",accountid,
                         begintime,endtime)
    @finances = finances.paginate(page:params[:page]).per_page(6)
  end

  def a_search_bybgtime(aid, bet)
    accountid = aid
    begintime = bet
    finances = Basic.where("pay_account = ? AND receive_time BETWEEN ? AND ?",accountid,
                           begintime,Time.now).order(receive_time: :desc)
    @finances = finances.paginate(page:params[:page]).per_page(6)
  end

  def a_search_byday(bet)
    begintime =bet
    finances = Basic.where("pay_account = ? AND receive_time = ?",params[:id],begintime)
    @finances = finances.paginate(page:params[:page]).per_page(6)
  end

end
