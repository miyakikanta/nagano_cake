class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(5)
  end
  
  def about
  end
end 
