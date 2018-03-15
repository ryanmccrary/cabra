module ApplicationHelper
  def is_active?(link_path)
    "active" if current_page?(link_path)
  end

  def google_link_to(address)
    link_to "#{address}", "http://maps.google.com/?q=#{address}"
  end

  def google_static_image(address)
    # cleanaddress = address.gsub(/ /, '%20')
    image_tag "http://maps.googleapis.com/maps/api/staticmap?maptype=roadmap&sensor=false \
    &center=Greenville%20SC&size=500x300 \
    &markers=color:green%7CGreenville%20SC \
    &markers=color:red%7Clabel:G%7C#{address} \
    &key=#{ENV['GOOGLE_MAPS_API_KEY']}
"
  end

  def string_to_time(input)
    Time.parse(input).strftime("%l:%M %p")
  end
end
