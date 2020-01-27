module ApplicationHelper

  def current_time_format(time)
    return nil unless time && time.is_a?(Time)

    time.strftime("%I:%M")
  end
end
