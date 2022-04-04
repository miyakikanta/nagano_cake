class Public::OrdersController < ApplicationController
  
  
  def index
    @orders = current_customer.orders
  end
  
  def new
    @order = Order.new
  end

  def create
    
  end
  
  def comfirm
  end

  def complete
  end

  def show
  end

  def order_params
   params.require(:order).permit(:name,:image,:introduction,:genre_id,:price,:is_active) 
  end

end
