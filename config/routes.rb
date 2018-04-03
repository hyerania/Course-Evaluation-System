Rails.application.routes.draw do
  
  namespace :admin do
    post 'questions/create'
  end
  
  namespace :admin do
    get 'questions/show'
  end

  namespace :admin do
    get 'questions/edit'
  end

  namespace :admin do
    get 'questions/new'
  end

  get 'admin/show'

  get 'students/show'

  resources :students
  get 'questions/view'

  get 'questions/edit'

  get 'questions/remove'

  #root to: 'welcome#show'
  root to: 'students#hello'
  get 'about', to: 'about#show'
  #Yang: just for testing
  get 'admin', to: 'admin#show'
  get 'admin/evaluations', to: 'evaluations#show'
  post 'admin/evaluations', to: 'evaluations#show'
  # '/' Route
  get 'welcome/show'
  get 'students/hello'
  
  
  # links
  
  #post 'evaluation/:id/selectq' => 'evaluation#selectq', :as => :selectq
  #post 'evaluation/selectr' => 'evaluation#selectr', :as => :selectr
  #post 'evaluation/save' => 'evaluation#save', :as => :save
  post 'admin/evaluations/new' => 'evaluations#create', :as => :create
  post 'admin/evaluations/selectr' => 'evaluations#selectr', :as => :selectr_evaluation
  get 'admin/evaluations/new' => 'evaluations#new', :as => :new_evaluation
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
