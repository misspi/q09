

module JsHelper
  
  def js_upload_file(bucket_id, extra = {})
    js_tag(:upload_file, {
      :load_path => "/buckets/#{bucket_id}.js",
      :save_path => buckets_path(:format => 'js'),
      :token => form_authenticity_token 
      }, extra)
  end
  
  def js_tag(name, params, extra)
    text = JSInline.inline(name, params.merge(extra))
    content_tag(:script, "/*<![CDATA[*/#{text}/*]]>*/", :type => 'text/javascript')
  end

end


