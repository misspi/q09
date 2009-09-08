

module JsHelper
  
  def js_upload_file(bucket_ids, extra = {})
    js_tag(:upload_file, {
      :load_path => buckets_path(:only => bucket_ids, :format => 'js'),
      :save_path => buckets_path(:format => 'js'),
      :token => form_authenticity_token 
      }, extra)
  end
  
  def js_tag(name, params, extra)
    text = JSInline.inline(name, params.merge(extra))
    content_tag(:script, "/*<![CDATA[*/#{text}/*]]>*/", :type => 'text/javascript')
  end

end


