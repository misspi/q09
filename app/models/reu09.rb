
class Reu09

  CUESTIONARIOS = [:presentacion, :tumisma, :experiencias, :dineros, :autoria,
    :habitat, :red, :comun]

  def self.cuestionarios
    CUESTIONARIOS
  end

  def self.c(group, name)
    PREGUNTAS[group][name]
  end

  PREGUNTAS = {
    :presentacion => {
      :ambito =>  [:actividad_arquitectura, :actividad_plasticas]
    }
  }

end