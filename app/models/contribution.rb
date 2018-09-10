class Contribution < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  belongs_to :reward, optional: true

  enum state: %i[started success failed]
  enum gateway: %i[esewa khalti cash_pickup]
end
