Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations:'users/registrations'
  }
root 'pages#index'

namespace :api do
 post :upload_image, to: 'utils#upload_image'
 resources :users,only: [] do
   member do
     post :follow
   end
 end
 resources :stories,only: [] do
  member do
     post :clap
     post :bookmark
  end
 end
end

resources :users, only: [] do
  collection do
    get :pricing  #/users/pricing
    get :payment
    post :pay
  end
end


resources :stories do
  resources :comments,only:[:create]
end
  # /@larry/article-123
  get '@:username/:story_id',to: 'pages#show',as: 'story_page'
  # /@larry/
  get '@:username',to: 'pages#user',as: 'user_page'

  get "/demo",to: 'pages#demo'

end
