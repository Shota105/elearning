Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/index', to: 'static_pages#index'
  get 'static_pages/about', to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
