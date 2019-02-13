Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root "static_pages#home"
    get "posts/index"
  	resources :posts
  end

  namespace :organizer do
  	get "organizer/posts/new", to: "posts#new"
  	post "organizer/posts/new", to: "posts#create"
  	resources :posts
  end
end
