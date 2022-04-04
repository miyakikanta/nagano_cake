class Item < ApplicationRecord
 has_one_attached :image 
 belongs_to :genre
 has_many :cart_items
 has_many :order_details
 
 
 validates :name, presence: true
 validates :introduction,presence: true
 validates :genre_id,presence:true
 validates :price,presence:true 
 validates :is_active, inclusion: { in: [true, false] }
 
def with_tax_price
    (price * 1.1).floor
end

end
