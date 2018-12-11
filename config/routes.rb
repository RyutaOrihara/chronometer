Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index,:show]
  root 'events#index'
  resources :events do
    member do
      get 'list'
    end
    collection do
      post :confirm
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :favorites,only:[:create,:destroy]
  resources :participations,only:[:create,:destroy]
end
