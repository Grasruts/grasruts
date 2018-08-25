class Campaign < ApplicationRecord
  include Discard::Model

  enum mode: [:aon, :flexible]
  enum status: [:draft, :pending, :rejected, :success, :fail]

  has_many :rewards, dependent: :destroy
  has_many :campaign_updates, dependent: :destroy
  has_many :campaign_images, dependent: :destroy

  belongs_to :user

  validates :name, :category, presence: true, on: :create
  
  validates :name, :location, :category, presence: true, on: :basic
  validates :uri, uniqueness: true, presence: true, on: :basic

  validates :goal, numericality: { only_integer: true }, presence: true, on: :financing
  validates :deadline, presence: true, on: :financing

  validates :about, presence: true, on: :description

  validates :card_description, length: { maximum: 40}, presence: true, on: :project_card

end
