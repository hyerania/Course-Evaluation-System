Rails.application.routes.draw do
  
  namespace :admin do
    namespace :questions do
      get 'edit/c2/:id', to: 'edit#c2'
    end
  end

  namespace :admin do
    namespace :questions do
      get 'edit/c3/:id', to: 'edit#c3'
    end
  end

  namespace :admin do
    namespace :questions do
      get 'edit/c4/:id', to: 'edit#c4'
    end
  end

  namespace :admin do
    namespace :questions do
      get 'edit/c5/:id', to: 'edit#c5'
    end
  end

  namespace :admin do
    namespace :questions do
      get 'new/c2'
    end
  end

  namespace :admin do
    namespace :questions do
      get 'new/c3'
    end
  end

  namespace :admin do
    namespace :questions do
      get 'new/c4'
    end
  end

  namespace :admin do
    namespace :questions do
      get 'new/c5'
    end
  end

  namespace :admin do
    namespace :questions do
      post 'new/show'
    end
  end
  
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
  
  namespace :admin do
    put 'questions/copy/:id', to: 'questions#copy'
  end
  
  get 'students/logout'
  
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
  
  resources :instructions
  
  root to: 'welcome#show'

  
  
  get 'about', to: 'about#show'
  get 'admin', to: 'admin#show'
  get 'admin/evaluations', to: 'evaluations#show'
  post 'admin/evaluations', to: 'evaluations#show'
  get 'admin/evaluations/view/:id', to: 'evaluations#view'
  # '/' Route
  get 'welcome/show'
  get 'students/hello'

  post 'admin/evaluations/new' => 'evaluations#create', :as => :create
  #post 'admin/evaluations' => 'evaluations#update_instructions', :as => :update_instructions
  post 'admin/evaluations/selectr' => 'evaluations#selectr', :as => :selectr_evaluation
  get 'admin/evaluations/selectr' => 'evaluations#selectr', :as => :selectr_evaluation_get
  get 'admin/evaluations/new' => 'evaluations#new', :as => :new_evaluation
  get 'questions/instructions' => 'students#instructions', :as => :instructions_student
  get 'questions/save' => 'questions#save', :as => :save_test
  patch 'admin/evaluations' => 'evaluations#update_instructions', :as => :update_instructions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
