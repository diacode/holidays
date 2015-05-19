module ApplicationHelper
  def gravatar_url(email, size = 80)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    url = "https://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def google_fonts
    [
      "Open+Sans:400italic,400,600,700,800"
    ].join '|'
  end

  def js_view_name
    "#{controller_name}_#{action_name}"
  end
end
