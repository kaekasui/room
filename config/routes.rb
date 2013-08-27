Room::Application.routes.draw do

  root 'home#index'
  get "/auth/:provider/callback" => "sessions#callback"

  resources :blogs, only: [:index, :show] do
    resources :blog_comments
  end
  resources :blog_links
  resources :mail_forms, only: [:create]

  namespace :admin do
    resources :blogs
  end
end
