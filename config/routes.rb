Rails.application.routes.draw do
  root 'tests#index'
  
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}, controllers: {registrations: 'users/registrations'}

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_taking_sessions, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
