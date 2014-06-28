module ApplicationHelper
  def is_active?(link_path)
    "active" if current_page?(link_path)
  end
end
