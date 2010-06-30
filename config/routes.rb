ActionController::Routing::Routes.draw do |map|
#  map.resources :feedbacks

  map.root :controller => 'about', :action => 'index'

#  map.resources(:questions, :as => 'preguntas') do |questions|
#    questions.resources :answers, :as => 'respuestas'
#  end
  map.resources :user_surveys
  map.resources :respuestas
  map.resources :cuestionario

  map.login "entrar", :controller => "user_sessions", :action => "new"
  map.logout "salir", :controller => "user_sessions", :action => "destroy"
  map.feedback "tuopinion", :controller => 'feedbacks', :action => 'new'

  # ADMIN
  map.admin "/admin", :controller => 'admin_feedbacks'
  map.resources :users, :as => 'usuarios', :path_prefix => 'admin', :controller => 'admin_users'
  map.resources :questions, :as => 'preguntas', :path_prefix => 'admin', :controller => 'admin_questions'
  map.resources :answers, :as => 'respuestas', :path_prefix => 'admin', :controler => 'admin_answers'
  map.resources :feedbacks, :as => 'comentarios', :path_prefix => 'admin', :controler => 'admin_feedbacks'

  map.resources :user_sessions, :as => 'sesion'
  #map.resources :buckets
end
