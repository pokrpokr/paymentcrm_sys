# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  User.create!(username:  "mac",
             real_name: "mic",
             user_type: "3",
             phone: "1234567890000",
             idcard: "110108990202992",
             email: "mac@email.com",
             password:              "123",
             password_confirmation: "123")

  25.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@email.com"
  user_type = "1"
  phone = "1111111111"
  idcard = "1111111111111"
  password = "password"
  User.create!(username: name,
               real_name: name,
               user_type: user_type,
               phone: phone,
               idcard: idcard,
               email: email,
               password:              password,
               password_confirmation: password)
  end

  25.times do |n|
    name = Faker::Name.name
    email = "example-#{n+26}@email.com"
    user_type = "2"
    phone = "1111111111"
    idcard = "1111111111111"
    password = "password"
    User.create!(username: name,
                 real_name: name,
                 user_type: user_type,
                 phone: phone,
                 idcard: idcard,
                 email: email,
                 password:              password,
                 password_confirmation: password)

  end

  Account.create!(
             user_id: 2,
             bank_account: "acc-123",
             bank_account_no: "6622 0123 3215 9879",
             bank_type: "",
             bank_phone: "",
             account_type: "1",
             area: "Beijing",
             balance: "919191",
             paypassword: "paypassword",
             paypassword_confirmation:"paypassword")

  50.times do |n|
    user_id = n+2
    bank_account = "acc-#{n+1}"
    bank_account_no = "6622 0454 0123 #{n+1}"
    bank_type = "ICBC"
    bank_phone = "8000-#{n+1}"
    account_type = "2"
    area = "Beijing"
    balance = "****"
    paypassword = "paypassword"
    Account.create!(
               user_id: user_id,
               bank_account: bank_account,
               bank_account_no: bank_account_no,
               bank_type: bank_type,
               bank_phone: bank_phone,
               account_type: account_type,
               area: area,
               balance: balance,
               paypassword: paypassword,
               paypassword_confirmation: paypassword)
  end

  25.times do |n|
    user_id = n+4
    bank_account = "acc-#{n+101}"
    bank_account_no = "6622 0454 0123 #{n+101}"
    bank_type = "CBC"
    bank_phone = "8000-#{n+101}"
    account_type = "2"
    area = "Beijing"
    balance = "****"
    paypassword = "paypassword"
    Account.create!(
              user_id: user_id,
              bank_account: bank_account,
              bank_account_no: bank_account_no,
              bank_type: bank_type,
              bank_phone: bank_phone,
              account_type: account_type,
              area: area,
              balance: balance,
              paypassword: paypassword,
              paypassword_confirmation: paypassword)
  end

  Order.create!(
           order_id: Time.now.inspect,
           order_info: "aaaaa",
           order_status: "完成",
           order_sum: "1111"
  )

  Order.create!(
      order_id: Time.now.inspect,
      order_info: "bbbbbb",
      order_status: "完成",
      order_sum: "9999"
  )

  UOrelation.create!(
                user_id: 2,
                order_id: 1
  )

  UOrelation.create!(
                user_id: 3,
                order_id: 1
  )

  UOrelation.create!(
                user_id: 2,
                order_id: 2
  )

  UOrelation.create!(
                user_id: 4,
                order_id: 2
  )

  Orderinfo.create!(
               order_id: 1,
               buyer_account: "acc-1",
               seller_account: "acc-2",
               product_info: "asdf"
  )

  Orderinfo.create!(
              order_id: 2,
              buyer_account: "acc-1",
              seller_account: "acc-3",
              product_info: "qwer"
  )