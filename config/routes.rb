Rails.application.routes.draw do
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
  get 'evaluation', to: 'evaluation#show'
  # '/' Route
  get 'welcome/show'
  get 'students/hello'
  
  # links
  
  post 'evaluation/:id/selectq' => 'evaluation#selectq', :as => :selectq
  post 'evaluation/selectr' => 'evaluation#selectr', :as => :selectr
  post 'evaluation/save' => 'evaluation#save', :as => :save
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
