BucketList::Application.routes.draw do
  resources :todos
  namespace :api do
    resources :todos
  end

  root 'home#index'
end
