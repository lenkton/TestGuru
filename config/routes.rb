Rails.application.routes.draw do
  resources :conditions
  root 'tests#index'
  
  devise_for :users,
             path: :gurus,
             path_names: {sign_in: :login, sign_out: :logout},
             controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_taking_sessions, only: %i[show update] do
    resources :gists, only: [:create]
    
    member do
      get :result
    end
  end
  
  resources :badges, only: %i[index show]

  namespace :admin do
    root to: 'tests#index'

    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index

    resources :badges
    resources :conditions
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
