Rails.application.routes.draw do
  namespace :dashboard do
    root "dashboard#home"
    devise_for :admins, controllers: {sessions: "dashboard/sessions"}
    resources :categories
    resources :members
  end

  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
