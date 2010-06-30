module CuestionarioHelper
  def next_step(url)
     hidden_field_tag(:next_url, url)
   end

  def link_to_answer(name)
    link_to 'Ver respuestas', {:controller => 'respuestas', :action => 'show', :id => name}, :class => 'see_answer'
  end

  def respuesta(value)
    value.blank? ? '(Sin contestar)' : value
  end
end
