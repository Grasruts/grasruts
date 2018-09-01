class Contribution < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  belongs_to :reward, optional: true

  enum state: %i[started success failed]
end
