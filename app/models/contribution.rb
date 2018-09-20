class Contribution < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  belongs_to :reward, optional: true
  has_many :payments
  enum state: %i[pending success failed]
  enum gateway: %i[esewa khalti cash_pickup]

  before_validation :set_uuid, on: :create

  def set_uuid
    self.uuid = SecureRandom.uuid
  end

end
