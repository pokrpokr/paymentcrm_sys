namespace :data do
  task :create_finances => [:environment] do
    user = User.find(2)
    account = Account.find(1)
    30.times do |i|
      Basic.create(
          finance_id: user.id,
          finance_type: "user",
          userid: user.id,
          pay_type: "001",
          pay_account: "2",
          to_bank_account: "6201 0293 09-1",
          to_bank_account_no: "6201 0293 09-2",
          to_bank_type: "ICBC",
          money: "532#{i}.01",
          tousername: "#{i}",
          info: "test-#{i}",
          pay_info: "testinfo-#{i+1}",
          pay_time: "2016-03-#{i+1}",
          receive_time: "2016-03-#{i+2}"
      )
    end

    28.times do |i|
      Basic.create(
          finance_id: user.id,
          finance_type: "user",
          userid: user.id,
          pay_type: "003",
          pay_account: "2",
          to_bank_account: "6201 0200 09-1",
          to_bank_account_no: "6201 0200 09-2",
          to_bank_type: "ICBC",
          money: "231#{i}.01",
          tousername: "#{i}",
          info: "test-#{i}",
          pay_info: "testinfo-#{i+1}",
          pay_time: "2016-02-#{i+1}",
          receive_time: "2016-02-#{i+1}"
      )
      end

      30.times do |i|
        Basic.create(
            finance_id: account.id,
            finance_type: "account",
            userid: user.id,
            pay_type: "001",
            pay_account: account.id,
            to_bank_account: "6201 0293 09-021",
            to_bank_account_no: "6201 0293 09-30",
            to_bank_type: "ABC",
            money: "2333#{i}.01",
            tousername: "#{i}",
            info: "test-#{i}",
            pay_info: "testinfo-#{i+1}",
            pay_time: "2016-03-#{i+1}",
            receive_time: "2016-03-#{i+2}"
        )
      end

      29.times do |i|
        Basic.create(
            finance_id: account.id,
            finance_type: "account",
            userid: user.id,
            pay_type: "001",
            pay_account: account.id,
            to_bank_account: "6201 0293 09-021",
            to_bank_account_no: "6201 0293 09-30",
            to_bank_type: "ABC",
            money: "3222#{i}.01",
            tousername: "#{i}",
            info: "test-#{i}",
            pay_info: "testinfo-#{i+1}",
            pay_time: "2016-04-#{i+1}",
            receive_time: "2016-04-#{i+2}"
        )
      end
    end
  end
