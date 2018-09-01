class Reward < ApplicationRecord
  belongs_to :campaign

  has_many :contributions, dependent: :destroy
    
  validates :name, presence: { message: 'Reward name is required' }
  validates :description, presence: { message: 'Reward Description is required' }
  validates :price, numericality: { only_integer: true, message: 'Price should be a number' }, presence: { message: 'Price is required' }
  validates :shipping_date, presence: { message: 'Shipping date is required' }
  validate :shipping_date_integrity

  def shipping_date_integrity
    if shipping_date <= Date.today
      errors.add(:shipping_date, "Shipping date can't be in the past")
    end
  end
end
