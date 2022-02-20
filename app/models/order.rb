class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_deposit: 0, confirmation: 1, making: 2, ready_to_ship: 3, delivered: 4 }
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  def subtotal
    item.with_tax_price * amount
  end
end
