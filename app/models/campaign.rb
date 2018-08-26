class Campaign < ApplicationRecord
  include Discard::Model

  enum mode: [:aon, :flexible]
  enum status: [:draft, :pending, :rejected, :success, :fail]

  has_many :rewards, dependent: :destroy
  has_many :campaign_updates, dependent: :destroy
  has_many :campaign_images, dependent: :destroy

  belongs_to :user

  validates :name, presence: { message: 'Campaign Name can not be empty'}, on: :create
  validates :category, presence: { message: 'Category can not be empty'}, on: :create
  
  validates :name, presence: { message: 'Campaign Name can not be empty'}, on: :basic
  validates :category, presence: { message: 'Category can not be empty'}, on: :basic
  validates :location, presence: { message: 'Location can not be empty'}, on: :basic
  validates :uri, uniqueness:{ message: 'Project URL already taken'}, on: :basic
  validates_presence_of :uri, message: 'Project URL cant be empty', on: :basic 

  validates :goal, numericality: { only_integer: true, message: 'Goal must be a number' }, presence: {message: 'Goal must not be empty'}, on: :financing
  validates :deadline, numericality: { less_than_or_equal_to: 365, only_integer: true, message: 'Collection Period must be a number and less than 365 days' }, presence: { message: 'Collection Period can not be empty'}, on: :financing

  validates :about, presence: true, on: :description

  validates :card_description, length: { maximum: 40, message: 'Description should not exceed more than 40 words'}, presence: { message: 'Description is required'}, on: :project_card
  validates :card_image, presence: true, on: :project_card

end
