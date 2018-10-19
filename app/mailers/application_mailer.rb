# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'contact@grasruts.com'
  layout 'mailer'
end
