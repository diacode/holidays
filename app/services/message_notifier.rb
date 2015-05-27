class MessageNotifier
  def initialize(args = {})
    @notifier = Slack::Notifier.new Rails.application.secrets.slack_webhook_url
  rescue Exception => e
    Rails.logger.warn 'Error trying to initialize Slack Notifier'
    Rails.logger.warn e
  end

  def notify_creation(vacation_request)
    message = [
      "> New vacation request from *#{vacation_request.user.full_name}*:",
      request_message(vacation_request),
      requested_days_list(vacation_request)
    ]

    @notifier.ping message.reject{ |part| part.nil? }.join "\n"
  rescue Exception => e
    Rails.logger.warn 'Error trying to send notification to Slack'
    Rails.logger.warn e
  end

  private

  def request_message(vacation_request)
    return if vacation_request.message.blank?

    "> _#{vacation_request.message}_"
  end

  def requested_days_list(vacation_request)
    vacation_request.requested_days.map { |requested_day|  "> :calendar: #{requested_day.day.to_formatted_s(:long)}" }.join "\n"
  end
end
