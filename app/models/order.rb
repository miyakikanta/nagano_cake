class Order < ApplicationRecord
belongs_to :customer
has_many :order_details

validates :customer_id,presence: true
validates :postal_code,presence: true
validates :address,presence: true
validates :name,presence: true
validates :shipping_cost,presence: true
validates :total_payment,presence: true

enum payment_method: { credit_card: 0, transfer: 1 }

end
