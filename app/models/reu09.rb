
class Reu09

  CUESTIONARIOS = [:presentacion, :tumisma, :experiencias, :dineros, :autoria,
    :habitat, :red, :comun]

  def self.cuestionarios
    CUESTIONARIOS
  end

  def self.c(group, name)
    PREGUNTAS[group][name]
  end

  RELEVANCE = [:none, :some, :quite, :lot, :full]

  PREGUNTAS = {
    :presentacion => {
      :ambito =>  [:actividad_arquitectura, :actividad_plasticas, :actividad_cine, :actividad_comic,
        :actividad_danza, :actividad_diseño, :actividad_docencia, :actividad_fotografia, :actividad_gestion,
        :actividad_literatura, :actividad_musica, :actividad_programacion, :actividad_netart,
        :actividad_performance, :actividad_street, :actividad_teatro, :actividad_otros
        ]
    },
    :experiencias => {
      :formacion => [:secundaria, :bachillerato, :fpmedio, :fpsuperio]
    },
    :tumisma => {
      :traject_eval => [:talent, :knowledge, :relations, :fame, :money, :marketing, :gender, :other],
    }
  }

end