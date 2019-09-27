Rails.application.routes.draw do

  resources :lessons, shallow: true do
    resources :answers
  end

  resources :categories

  namespace :admin do
    resources :users
    resources :categories do
      resources :words do
        resources :choices
      end
    end
  end

  resources :users, except: :new do
    member do
      get :following, :followers
    end
    resources :words, only: :index
  end
  resources :relationships, only: [:create,:destroy]

  get 'relationships/create'
  get 'relationships/delete'
  get 'create/delete'
  get '/login', to: 'sessions#new'
  resources :users, except: :new
  resources :sessions, only: [:create, :destroy]
  get '/signup', to: 'users#new'
  # get '/login', to: 'users#login'
  root 'static_pages#home'
  get 'static_pages/home', to: 'static_pages#home'
  get 'static_pages/about', to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
