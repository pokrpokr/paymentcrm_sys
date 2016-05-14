module OrdersHelper
  def search_order
    if params[:order_id].present? && params[:commit] == "搜索"
      order = Order.where("order_id = ?", params[:order_id])
      if order.present?
        @orders = order.paginate(page: params[:page])
      end
    elsif params[:order_id].nil? && params[:commit] == "搜索"
      @orders = {}
    elsif params[:order_id].nil? && params[:commit].nil?
      @orders = Order.paginate(page: params[:page]).per_page(10)
    end
  end
end
