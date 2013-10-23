Room::Application.routes.draw do

  root "home#index"
  get "/auth/:provider/callback" => "sessions#callback"
  get "/logout" => "sessions#destroy", as: "logout"

  resources :blogs, only: [:index, :show] do
    resources :blog_comments
  end
  resources :mail_forms, only: [:create]
  resources :users, only: [:edit, :update]

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
    resources :users do
      post "/update_all" => "users#update_all", on: :collection
    end
    resources :versions, only: [:index, :destroy] do
      post "/update_all" => "versions#update_all", on: :collection
    end
  end
end
