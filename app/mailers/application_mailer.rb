class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.x.default_from_email_address
  layout 'mailer'
end
