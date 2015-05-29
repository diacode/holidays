class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def on_holidays?
    object.on_holidays? ? content_tag(:span, 'On holidays', class: 'status on-holidays') : content_tag(:span, 'Working', class: 'status working')
  end

  def status_class
    object.on_holidays? ? 'on-holidays' : 'working'
  end
end
