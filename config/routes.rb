Room::Application.routes.draw do

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
    resources :blog_categories, only: [:index, :destroy] do
      post "/update_all" => "blog_categories#update_all", on: :collection
    end
    resources :blog_comments, only: [:index, :destroy]
    resources :blog_links, only: [:index, :edit, :update, :destroy] do
      post "/update_all" => "blog_links#update_all", on: :collection
    end
    resources :mail_forms, only: [:index, :destroy]
    resources :priorities, only: [:index, :destroy] do
      post "/update_all" => "priorities#update_all", on: :collection
    end
    resources :projects
    resources :statuses, only: [:index, :destroy] do
      post "/update_all" => "statuses#update_all", on: :collection
    end
    resources :tickets do
      post "/set_tickets" => "tickets#set_tickets", on: :collection
    end
    resources :ticket_categories, only: [:index, :new, :create, :destroy] do
      post "/update_all" => "ticket_categories#update_all", on: :collection
    end
    resources :ticket_versions, only: [:index, :destroy, :new, :create] do
      post "/update_all" => "ticket_versions#update_all", on: :collection
    end
    resources :trackers, only: [:index, :destroy] do
      post "/update_all" => "trackers#update_all", on: :collection
    end
    resources :users, only: [:index, :destroy]  do
      post "/update_all" => "users#update_all", on: :collection
    end
    resources :versions, only: [:index, :destroy, :new, :create] do
      post "/update_all" => "versions#update_all", on: :collection
    end
  end
end
