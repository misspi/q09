
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

  FREQUENCY = [:never, :sometimes, :usually, :always]

  PREGUNTAS = {
    :presentacion => {
      :ambito =>  [:actividad_arquitectura, :actividad_plasticas, :actividad_cine, :actividad_comic,
        :actividad_danza, :actividad_diseño, :actividad_docencia, :actividad_fotografia, :actividad_gestion,
        :actividad_literatura, :actividad_musica, :actividad_programacion, :actividad_netart,
        :actividad_performance, :actividad_street, :actividad_teatro, :actividad_otros
        ]
    },
    :experiencias => {
      :studies_eval => [:academica, :transmision, :talleres, :empleo, :aprendizaje, :internet, :biblioteca, :other],
      :formation_done => [:name, :duration, :entity, :amount, :evaluation],
      :form_access => [:money, :offer, :info, :time, :geo, :other]
    },
    :tumisma => {
      :traject_eval => [:talent, :knowledge, :relations, :fame, :money, :marketing, :gender, :other],
    },
    :dineros => {
      :ajob_xtra => [:night, :holiday, :overtime],
      :job_money => [:less600, :from1000to1400, :from1400to1800, :more1800],
      :ajob_decision => [:total, :client, :limited, :none, :collective],
      :ajob_vocation_money => [:family, :work, :grant, :sponsor, :sale],
      :grants_bad => [:grantpoor, :grantoffer, :grantcriteria, :grantinfo, :granttime, :grantgeo, :grantage]
      }
  }

end