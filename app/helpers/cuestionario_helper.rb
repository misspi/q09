module CuestionarioHelper
  def next_step(url)
     hidden_field_tag(:next_url, url)
   end
end
