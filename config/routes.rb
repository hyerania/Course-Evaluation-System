Rails.application.routes.draw do
  namespace :admin do
    patch 'questions/update'
  end
  
  namespace :admin do
    post 'questions/create'
  end
  
  namespace :admin do
    get 'questions/show'
  end

  namespace :admin do
    get 'questions/edit/:id', to: 'questions#edit'
  end
  
  namespace :admin do
    delete 'questions/delete/:id', to: 'questions#delete'
  end

  namespace :admin do
    get 'questions/new'
  end
  
  #GET
  get 'welcome/show'
  
  get 'admin/login'
  get 'admin/show'
  get 'admin/logout'
  
  get 'students/welcome'
  get 'students/register'
  get 'students/logout'
  get 'students/show'
  
  get 'admin/questions/show'
  
  get 'questions/edit'
  get 'questions/remove'
  
  #POST
  post 'students/welcome'
  
  post 'admin/delete'
  post 'admin/update'
  
  post 'students/show'
  post 'admin/login'
  post 'admin/show'
  
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
  get 'admin/evaluations/selectr' => 'evaluations#selectr', :as => :selectr_evaluation_get
  get 'admin/evaluations/new' => 'evaluations#new', :as => :new_evaluation
  get 'questions/instructions' => 'students#instructions', :as => :instructions_student
  get 'questions/save' => 'questions#save', :as => :save_test
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
