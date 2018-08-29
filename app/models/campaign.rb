class Campaign < ApplicationRecord
  include Discard::Model

  enum mode: [:aon, :flexible]
  enum status: [:draft, :pending, :online, :rejected, :success, :fail]

  has_many :rewards, dependent: :destroy
  has_many :campaign_updates, dependent: :destroy
  has_many :campaign_images, dependent: :destroy

  has_attached_file :card_image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :card_image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  belongs_to :campaign_category

  validates :name, presence: { message: 'Campaign Name can not be empty'}, on: :create
  validates :campaign_category, presence: { message: 'Category can not be empty'}, on: :create
  
  validates :name, presence: { message: 'Campaign Name can not be empty'}, on: :basic
  validates :campaign_category, presence: { message: 'Category can not be empty'}, on: :basic
  validates :location, presence: { message: 'Location can not be empty'}, on: :basic
  validates :uri, uniqueness:{ message: 'Project URL already taken'}, on: :basic
  validates_presence_of :uri, message: 'Project URL cant be empty', on: :basic 

  validates :goal, numericality: { only_integer: true, message: 'Goal must be a number' }, presence: {message: 'Goal must not be empty'}, on: :financing
  validates :deadline, numericality: { less_than_or_equal_to: 365, only_integer: true, message: 'Collection Period must be a number and less than 365 days' }, presence: { message: 'Collection Period can not be empty'}, on: :financing

  validates :about, presence: {message: 'Description is required'}, on: :description

  validates :card_description, length: { maximum: 120, message: 'Description should not exceed more than 40 words'}, presence: { message: 'Description is required'}, on: :project_card
  validates :card_image, attachment_presence: {message: 'Image is required'}, on: :project_card
  validates_with AttachmentPresenceValidator, attributes: :card_image, on: :project_card
  validates_with AttachmentSizeValidator, attributes: :card_image, less_than: 1.megabytes, on: :project_card

  validates :user, presence: {message: 'KYC is required'}, on: :publish
  after_update :save_video_id, :if => :video_changed?

  private

  def save_video_id
    VideoInfoExtractorWorker.perform_async(self.id)
  end
end
