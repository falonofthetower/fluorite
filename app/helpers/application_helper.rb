module ApplicationHelper
  def title(page_title)
    base_title = "Peter's Page"
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end
end
