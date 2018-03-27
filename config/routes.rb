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
  # '/' Route
  get 'welcome/show'
  get 'students/hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
