class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  # enum payment_method: { credit_card: 0, transfer: 1 }
  
end
