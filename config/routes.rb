Room::Application.routes.draw do

  root 'home#index'

  resources :blogs, only: [:index, :show] do
    resources :blog_comments
  end
  resources :blog_links
  resources :mail_forms, only: [:create]

  namespace :admin do
    resources :blogs
  end
end
