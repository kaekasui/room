Room::Application.routes.draw do

  get "users/index"
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
    resources :mail_forms, only: [:index]
    resources :versions, only: [:index, :destroy] do
      post "/update_all" => "versions#update_all", on: :collection
    end
  end
end
