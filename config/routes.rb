Rails.application.routes.draw do
  
  resources :saved_messages

  resources :tweets do
    member do
      post :retweet
    end
  end
  get 'pages/home'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :notifications do
    collection do
            # method in notifications controller
      post :mark_as_read
    end
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :forum_threads do
    resources :forum_posts, module: :forum_threads
  end

  root to: 'forum_threads#index'
end
