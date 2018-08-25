class Reward < ApplicationRecord
  belongs_to :campaign

  validates :name, :description, presence: true
  validates :price, numericality: { only_integer: true }, presence: true
end
