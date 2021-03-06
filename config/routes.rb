Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ""
  end

  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /en|vi/ do
    devise_for :users, skip: :omniauth_callbacks

    devise_scope :user do
      get "/login" => "devise/sessions#new"
      get "/logout" => "devise/sessions#destroy"
    end
  
    resources :users, only: [:show, :update]
    post "create_user" => "admin/users#create", as: :create_user
    root "static_pages#home"
    get "posts/index"
    resources :posts

    namespace :admin do
      resources :users, except: [:show, :create], concerns: :paginatable
    end

    namespace :organizer do
      get "organizer/posts/new", to: "posts#new"
      post "organizer/posts/new", to: "posts#create"
      resources :posts
      resources :events do
        collection do
          get :myevents
        end
      end
    end
  end
end
