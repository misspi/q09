module LayoutHelper

  def cuestionario_nav(name)
    path = cuestionario_path(name)
    label = t("layouts.basic.#{name}")
    current_page?(path) ? "<span>#{label}</span>" : link_to(label, path)
  end
end
