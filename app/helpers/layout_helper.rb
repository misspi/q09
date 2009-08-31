module LayoutHelper

  def cuestionario_nav(name)
    path = cuestionario_path(name)
    label = t("layouts.user.#{name}")
    current_page?(path) ? "#{label}" : link_to(label, path)
  end
end
