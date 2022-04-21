class Public::OrdersController < ApplicationController
before_action :authenticate_customer!
 
  def index
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def comfirm

      @cart_items = current_customer.cart_items
      @order = Order.new(order_params)

   if params[:order][:select_address] == "0"

      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

   elsif params[:order][:select_address] == "1"

      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

   elsif params[:order][:select_address] == "2"
  
   else
   render new_public_order_path 
   end
  end

  def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.shipping_cost = 800
    if @order.save
      redirect_to public_orders_complete_path
    else
      render :new
    end 
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
       order_details = OrderDetail.new
       order_details.item_id = cart_item.item_id
       order_details.order_id = @order.id
       order_details.amount = cart_item.amount
       order_details.price = cart_item.item.price
       order_details.save
      end
      @cart_items.destroy_all
  end

  def complete
  end 

  def show
    @order = Order.find(params[:id]) 
    @orders = current_customer.orders
  end
 
private
  def order_params
   params.require(:order).permit(:payment_method,:postal_code, :address, :name,:total_payment)
  end

end
