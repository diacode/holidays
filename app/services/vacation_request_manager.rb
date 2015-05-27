class VacationRequestManager
  def initialize(vacation_request)
    @vacation_request = vacation_request
  end

  def approve
    @vacation_request.approve!

    deliver_notification_email
  end

  def reject
    @vacation_request.reject!

    deliver_notification_email
  end

  def approve_requested_day(requested_day)
    requested_day.approved!

    deliver_notification_email
  end

  def reject_requested_day(requested_day)
    requested_day.rejected!

    deliver_notification_email
  end

  private

  def deliver_notification_email
    return if @vacation_request.requested_days.requested.any?

    approved_day_notification_mailer.deliver_now if @vacation_request.requested_days.approved.any?
    rejected_day_notification_mailer.deliver_now if @vacation_request.requested_days.rejected.any?
  end

  def approved_day_notification_mailer
    VacationRequestsMailer.approved_days(@vacation_request.user, @vacation_request.requested_days.approved)
  end

  def rejected_day_notification_mailer
    VacationRequestsMailer.rejected_days(@vacation_request.user, @vacation_request.requested_days.rejected)
  end
end
