class Address < ApplicationRecord
  belongs_to :customer
  def full_address
      '〒' + postal_code.to_s + ' ' + address.to_s + ' ' + name.to_s
  end

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end
