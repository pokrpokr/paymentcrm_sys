json.finance do
  json.arry! @finances,:userid,:pay_type,:pay_account,:to_bank_account,:to_bank_account_no,:to_bank_type,:money,
             :tousername,:pay_info,:pay_time,:receive_time
end
