Rails.application.routes.draw do
  get 'admin/show'

  get 'students/show'

  resources :students
  get 'questions/view'

  get 'questions/edit'

  get 'questions/remove'

  root to: 'welcome#show'
  get 'about', to: 'about#show'
  #Yang: just for testing
  get 'admin', to: 'admin#show'
  # '/' Route
  get 'welcome/show'
  get 'students/hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
