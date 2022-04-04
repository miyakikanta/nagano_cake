class Public::CustomersController < ApplicationController
before_action :authenticate_customer!,only: [:show,:edit,:update,:unsubscribe,:withdraw]

  def show
      @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def update
    
  customer = Customer.find(params[:id])
  customer.update(customer_params) 
  redirect_to public_customer_path(current_customer)
 
  end

  def unsubscribe
    @customer = current_customer
  end
 
  def withdraw
  @customer = current_customer
  @customer.update(is_deleted: true)
  reset_session
  redirect_to public_homes_top_path
  end
  
  private
        def customer_params 
            params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,:postal_code, :address, :telephone_number, :is_deleted,:email)
        end
end 