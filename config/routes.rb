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
  get 'students/welcome'

  get 'admin/show'

  get 'welcome/show'

  get 'students/register'
  
  get 'students/show'
  
  post 'students/welcome'
  
  post 'students/show'
  
  post 'admin/show'
  

  #get 'questions/view'

  get 'questions/edit'

  get 'questions/remove'
  
  
  match '/questions', to: 'questions#view', via: [:get, :post]
  
  resources :students
  
  resources :questions, only: [:view], via: [:post]
  
  root to: 'welcome#show'

  get 'about', to: 'about#show'
  get 'admin', to: 'admin#show'
  get 'admin/evaluations', to: 'evaluations#show'
  post 'admin/evaluations', to: 'evaluations#show'
  # '/' Route
  get 'welcome/show'
  get 'students/hello'

  post 'admin/evaluations/new' => 'evaluations#create', :as => :create
  post 'admin/evaluations/selectr' => 'evaluations#selectr', :as => :selectr_evaluation
  get 'admin/evaluations/new' => 'evaluations#new', :as => :new_evaluation
  get 'questions/instructions' => 'students#instructions', :as => :instructions_student
  get 'questions/save' => 'questions#save', :as => :save_test
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
