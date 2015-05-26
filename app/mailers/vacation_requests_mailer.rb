class VacationRequestsMailer < ApplicationMailer
  def admin_notification(vacation_request)
    @vacation_request = vacation_request
    @user = vacation_request.user

    mail to: User.admin_emails, subject: "New vacation request from #{@user.full_name}"
  end

  def approved_days(user, days)
    @days = Array days
    @user = user

    mail to: user.email, subject: "Approved vacation days"
  end
end
