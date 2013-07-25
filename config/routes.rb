Room::Application.routes.draw do

  resources :blog_comments

  resources :blogs

  root 'home#index'
end
