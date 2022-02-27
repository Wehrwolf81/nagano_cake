class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  def subtotal
    item.with_tax_price.to_i* amount.to_i
  end
  
  
  validates :amount, presence: true
end
