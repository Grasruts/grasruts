class Faq < ApplicationRecord
  belongs_to :campaign

  validates :name, presence: { message: 'Name is required' }
  validates :description, presence: { message: 'Description is required' }
end
