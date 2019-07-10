Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  namespace :dashboard do
    root "dashboard#home"
    devise_for :admins, controllers: {sessions: "dashboard/sessions"}
    resources :categories
    resources :members
    resources :tests do
      member do
        get :publish, :draff
      end
    end
  end

  namespace :user do
    root "static_pages#home"
    devise_for :members, controllers: {registrations: "user/registrations",
      sessions: "user/sessions"}, path: ""
    get :profile, to: "members#show"
    get :published_tests, to: "tests#index"
    resources :tests do
      member do
        get :join
      end
    end
    resources :user_tests do
      resources :user_answers, only: [:create]
    end
  end
end
