class OrdersController < ApplicationController
  include OrdersHelper
  def show
    @order = Order.find(params[:id])
    @orderinfo = @order.orderinfo
  end

  def index
    search_order
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:success] = "确认成功"
      redirect_to @order
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    flash[:success] = "订单删除成功"
    redirect_to orders_url
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
