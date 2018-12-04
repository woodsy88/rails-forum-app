Rails.application.routes.draw do
  get 'pages/home'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end


  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :forum_threads do
    resources :forum_posts, module: :forum_threads
  end

  root to: 'forum_threads#index'
end
