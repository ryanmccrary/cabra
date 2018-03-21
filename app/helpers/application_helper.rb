module ApplicationHelper
  def is_active?(link_path)
    "active" if current_page?(link_path)
  end

  def string_to_time(input)
    Time.parse(input).strftime("%l:%M %p")
  end
end
