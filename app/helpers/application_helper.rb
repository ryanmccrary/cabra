module ApplicationHelper
  def is_active?(link_path)
    "active" if current_page?(link_path)
  end

  def google_link_to(address)
    link_to "#{address}", "http://maps.google.com/?q=#{address}"
  end

  def google_static_image(address)
    image_tag "http://maps.googleapis.com/maps/api/staticmap?maptype=roadmap&sensor=false&markers=Greenville%20SC&size=500x300&markers=#{address}"
  end

  def string_to_time(input)
    Time.parse(input).strftime("%l:%M %p")
  end
end
