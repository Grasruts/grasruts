class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :contribution

  enum state: %i[pending success failed]
end
