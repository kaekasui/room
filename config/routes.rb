Room::Application.routes.draw do

  resources :ticket_categories

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    delete 'users/disconnect/:provider' => 'users/omniauth_callbacks#disconnect', as: 'disconnect_omniauth_provider'
  end

  root "home#index"

  resources :blogs, only: [:index, :show] do
    resources :blog_comments
  end
  resources :mail_forms, only: [:create]

  namespace :admin do
    resources :blogs
    resources :blog_comments
    resources :blog_links do
      post "/update_all" => "blog_links#update_all", on: :collection
    end
    resources :functions
    resources :mail_forms
    resources :priorities do
      post "/update_all" => "priorities#update_all", on: :collection
    end
    resources :projects
    resources :statuses do
      post "/update_all" => "statuses#update_all", on: :collection
    end
    resources :tickets
    resources :trackers do
      post "/update_all" => "trackers#update_all", on: :collection
    end
    resources :users do
      post "/update_all" => "users#update_all", on: :collection
    end
    resources :versions, only: [:index, :destroy, :new, :create] do
      post "/update_all" => "versions#update_all", on: :collection
    end
  end
end
