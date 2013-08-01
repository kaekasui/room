Room::Application.routes.draw do

  resources :blog_links

  root 'home#index'

  resources :blogs, only: [:index, :show] do
    resources :blog_comments
  end
end
