Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'link', to: 'welcome#link'
  get 'test', to: 'welcome#test'
  resources :articles
end
