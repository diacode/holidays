class VacationRequestsMailer < ApplicationMailer
  def admin_notification(vacation_request)
    @vacation_request = vacation_request
    @user = vacation_request.user

    mail to: User.admin_emails, subject: "New vacation request from #{@user.full_name}"
  end
end
