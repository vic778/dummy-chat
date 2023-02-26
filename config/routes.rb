# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions},
                       path_names: { sign_in: :login }

    resource :user, only: [:update]
    get 'user/auto_login', to: 'users#auto_login'

    resources :conversations do 
      resources :messages
    end

  end
end