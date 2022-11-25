class OrdersController < InheritedResources::Base

  def create
    create!(:notice => "Great! Order has updated successfully.") { orders_url }
  end

  def update
    update!(:notice => "Great! Order has updated successfully.") { orders_url }
  end

  private

    def order_params
      params.require(:order).permit(:amount, :details, :status, :order_date, :customer_id, product_ids:[])
    end


end
