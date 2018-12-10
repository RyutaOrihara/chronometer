Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index,:show]
  root 'events#index'
  resources :events do
    collection do
      post :confirm
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :favorites,only:[:create,:destroy]

end
