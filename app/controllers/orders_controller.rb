class OrdersController < ApplicationController
  include OrdersHelper
  def show
    @order = Order.find(params[:id])
    @orderinfo = @order.orderinfo
  end

  def index
    search_order
  end
end
