ActionController::Routing::Routes.draw do |map|

  map.resources :questions do |questions|
    questions.resources :answers
  end


  map.resources :surveys
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
