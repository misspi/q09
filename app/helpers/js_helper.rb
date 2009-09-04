

module JsHelper
  
  def js_upload_file(extra = {})
    js_tag(:upload_file, {
      :path => buckets_path(:format => 'js'), 
      :token => form_authenticity_token 
      }, extra)
  end
  
  def js_tag(name, params, extra)
    text = JSInline.inline(name, params.merge(extra))
    content_tag(:script, "/*<![CDATA[*/#{text}/*]]>*/", :type => 'text/javascript')
  end

end


