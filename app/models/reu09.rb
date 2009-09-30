
class Reu09

  CUESTIONARIOS = [:presentacion, :tumisma, :experiencias, :dineros, :autoria,
    :habitat, :red, :comun]

  def self.cuestionarios
    CUESTIONARIOS
  end

  def self.c(group, name)
    PREGUNTAS[group][name]
  end

  RELEVANCE = [:none, :some, :lot, :full]

  FREQUENCY = [:never, :sometimes, :usually, :always]

  IMPORTANCE = [:nimp, :few, :important, :very]

  QUALITY = [:very_bad, :bad, :acceptable, :good, :very_good]

  PREGUNTAS = {
    :presentacion => {
      :ambito =>  [:actividad_arquitectura, :actividad_plasticas, :actividad_cine, :actividad_comic,
        :actividad_danza, :actividad_diseño, :actividad_docencia, :actividad_fotografia, :actividad_gestion,
        :actividad_literatura, :actividad_musica, :actividad_programacion, :actividad_netart,
        :actividad_performance, :actividad_street, :actividad_teatro, :actividad_otros
      ]
    },
    :experiencias => {
      :studies_eval => [:academica, :transmision, :talleres, :empleo, :aprendizaje, :internet, :biblioteca],
      :formation_done => [:name, :duration, :entity, :amount, :evaluation],
      :form_access => [:money, :offer, :info, :time, :geo]
    },
    :tumisma => {
      :traject_eval => [:talent, :knowledge, :relations, :fame, :money, :marketing, :gender],
    },
    :dineros => {
      :ajob_xtra => [:night, :holiday, :overtime],
      :job_money => [:less600, :from1000to1400, :from1400to1800, :more1800],
      :ajob_decision => [:total, :client, :limited, :none, :collective],
      :ajob_vocation_money => [:family, :work, :grant, :sponsor, :sale],
      :grants_bad => [:grantpoor, :grantoffer, :grantcriteria, :grantinfo, :granttime, :grantgeo, :grantage]
    },
    :autoria => {
      :author => [:none, :various, :alias, :collective, :name, :company]
    },
    :habitat => {
      :place => [:suburb, :center, :city, :village],
      :culture_infra => [:cinema, :concert, :theater, :biblio, :exhibition, :space, :museum, :internet, :social],
      :homes => [:property, :rent, :cession],
      :living => [:alone, :family, :share],
      :home_cost => [:less100, :from100to200, :from200to300, :from300to400, :from400to500, :from500to600,  :from600to700, :more700],
      :studio => [:studio_home, :studio_rent, :studio_cession, :studio_company],
      :expenses => [:promotion, :telecom, :formation, :mobility, :material],
      :travel  => [:never, :sometimes, :usually, :must]
    },

    :redes => {
      :operating => [:mac, :windows, :linux],
      :internet => [:home, :cyber, :work],
      :internet_time => [:less1, :from1to2, :from2to3, :from3to4, :from4to5, :more5],
      :p2p => [:usually, :ocasion, :never, :know],
      :access=> [:access_yes, :without, :access_no]
    },
    :comun => {
      :policy => [:access, :extend, :policy_future, :work, :patrimony],
      :culture_steps => [:budget, :sponsors, :space, :participate, :industry, :free_net, :pirate, :events, :law],
      :culture_action => [:sindicate, :asociation, :movement, :group],
      :polis_action => [:polis_manifestation, :polis_act, :polis_campaign],
      :conditions => [:excelent, :dignified, :normal, :precarious, :miserable],
      :administration => [:culture, :home, :inmigration, :work, :health, :gender],
      :future => [:platform, :asociation, :syndicate, :campaign, :festival, :ofices, :online, :ocupy]
    },

  }

end