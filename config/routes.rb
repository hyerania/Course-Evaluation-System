Rails.application.routes.draw do
  root to: 'welcome#show'
  get 'about', to: 'about#show'
  # '/' Route
  get 'welcome/show'
  get 'students/hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
