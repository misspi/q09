module ApplicationHelper

  def title(page_title, options = {})
    options = {:show => true, :tag => 'h1'}.update(options)
    content_for(:title) { page_title }
    options[:show] ? content_tag(options[:tag], page_title) : ''
  end

  def empty_label
    "<label>&nbsp;</label>"
  end

end
