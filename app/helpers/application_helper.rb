# Methods added to this helper will be available to all templates in the
# application.
module ApplicationHelper

  def title(page_title, options = {})
    options = {:show => true, :tag => 'h1'}.update(options)
    content_for(:title) { page_title }
    content_tag(options[:tag], page_title) if options[:show]
  end

  def empty_label
    "<label>&nbsp;</label>"
  end

end
