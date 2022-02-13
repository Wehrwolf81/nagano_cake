class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_detail, dependent: :destroy

  # enum is_active: { selling: 0, sold_out: 1 }
  def with_tax_price
    (price * 1.1).floor
  end
end
