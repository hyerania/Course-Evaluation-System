Rails.application.routes.draw do
  
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
  #Yang: just for testing
  get 'admin', to: 'admin#show'
  # '/' Route
  

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
