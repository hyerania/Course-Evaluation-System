Rails.application.routes.draw do
  resources :students
  get 'questions/view'

  get 'questions/edit'

  get 'questions/remove'

  #root to: 'welcome#show'
  root to: 'students#hello'
  get 'about', to: 'about#show'
  # '/' Route
  get 'welcome/show'
  get 'students/hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
