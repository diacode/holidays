# Preview all emails at http://localhost:3000/rails/mailers/vacation_requests_mailer
class VacationRequestsMailerPreview < ActionMailer::Preview
  def admin_notification
    vacation_request = VacationRequest.first
    VacationRequestsMailer.admin_notification vacation_request
  end

  def approved_days
    vacation_request = VacationRequest.first

    user = vacation_request.user
    days = vacation_request.requested_days.approved

    VacationRequestsMailer.approved_days user, days
  end
end
