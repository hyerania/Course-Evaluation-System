Rails.application.routes.draw do
  get 'admin/show'

  get 'welcome/show'

  get 'students/hello'
  
  get 'students/show'

  get 'questions/view'

  get 'questions/edit'

  get 'questions/remove'
  
  root to: 'welcome#show'
  #root to: 'students#hello'
  get 'about', to: 'about#show'
  #Yang: just for testing
  get 'admin', to: 'admin#show'
  # '/' Route
  

  resources :students

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
