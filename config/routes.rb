ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'about', :action => 'index'

  map.resources(:questions, :as => 'preguntas') do |questions|
    questions.resources :answers, :as => 'respuestas'
  end
  map.resources :user_surveys

  map.resources :cuestionario

  map.login "entrar", :controller => "user_sessions", :action => "new"
  map.logout "salir", :controller => "user_sessions", :action => "destroy"
  map.resources :user_sessions, :as => 'sesion'
  map.resources :users, :as => 'usuarios'
  map.resources :buckets

  map.simple '/simple', :controller => 'about', :action => 'simple'
end
