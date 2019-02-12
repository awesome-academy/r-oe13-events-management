Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root "static_pages#home"
  end
end
