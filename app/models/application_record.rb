# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_validation :set_uuid, on: :create

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
