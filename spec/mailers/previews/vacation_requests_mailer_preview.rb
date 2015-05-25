# Preview all emails at http://localhost:3000/rails/mailers/vacation_requests_mailer
class VacationRequestsMailerPreview < ActionMailer::Preview
  def admin_notification
    vacation_request = VacationRequest.last
    VacationRequestsMailer.admin_notification vacation_request
  end
end
