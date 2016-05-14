class Order < ActiveRecord::Base
  has_many :users, through: :u_orelations
  has_many :u_orelations
  has_one :orderinfo
end
