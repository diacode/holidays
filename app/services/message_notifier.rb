class MessageNotifier
  def initialize(args = {})
    rescue_and_log_error { @notifier = Slack::Notifier.new Rails.application.secrets.slack_webhook_url }
  end

  def notify_new_vacation_request(vacation_request)
    @vacation_request = vacation_request

    message = [
      "> New vacation request from *#{vacation_request.user.full_name}*:",
      request_message,
      requested_days_list,
      days_left
    ]

    rescue_and_log_error { @notifier.ping formatted_message(message) }
  end

  def notify_requested_days_status(vacation_request)
    @vacation_request = vacation_request

    message = [
      "> *#{vacation_request.user.full_name}* here's your vacation request new status:",
      request_message,
      requested_days_status_list,
      days_left
    ]

    rescue_and_log_error { @notifier.ping formatted_message(message) }
  end

  private

  def rescue_and_log_error
    yield
  rescue Exception => e
    Rails.logger.warn 'Error trying to send notification to Slack'
    Rails.logger.warn e
  end

  def request_message
    return if @vacation_request.message.blank?

    "> _#{@vacation_request.message}_"
  end

  def requested_days_list
    @vacation_request.requested_days.map { |requested_day|  ">     :calendar: #{requested_day.day.to_formatted_s(:long)}" }.join "\n"
  end

  def requested_days_status_list
    @vacation_request.requested_days.map { |requested_day|  ">     #{status_icon(requested_day)} #{requested_day.day.to_formatted_s(:long)}" }.join "\n"
  end

  def days_left
    user = @vacation_request.user
    available_days = user.available_days

    "> You still have *#{available_days}* #{'day'.pluralize(available_days)} left."
  end

  def status_icon(requested_day)
    case requested_day[:status]
    when RequestedDay.statuses[:approved]
      ':white_check_mark:'
    when RequestedDay.statuses[:rejected]
      ':x:'
    else
      ':calendar:'
    end
  end

  def formatted_message(message)
    message.reject{ |part| part.nil? }.join "\n"
  end
end
