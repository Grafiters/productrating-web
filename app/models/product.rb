
# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  price      :decimal(10, )
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  has_many :purchases
  
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  
  validate :quantity_within_limit
  validate :purchase_exists
  
  def quantity_within_limit
    return unless quantity

    if quantity < 0
      errors.add(:quantity, 'too few')
    end
  end

  def purchase_exists
    if purchases.exists?(product_id: id)
      return true
    else
      return false
    end
  end

end
