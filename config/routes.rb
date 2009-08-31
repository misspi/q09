ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'about', :action => 'index'

  map.resources :questions do |questions|
    questions.resources :answers
  end
  map.resources :survey

  map.resources :cuestionario



end
