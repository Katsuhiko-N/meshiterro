Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'users/sign_up' => 'devise/sessions#new'
  get 'homes/about' => 'homes#about', as: "about"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#         post_images_new GET    /post_images/new(.:format)        post_images#new
#       post_images_index GET    /post_images/index(.:format)      post_images#index
#         post_images_show GET    /post_images/show(.:format)     post_images#show
#         new_user_session GET    /users/sign_in(.:format)        devise/sessions#new
#                     root GET    /                               homes#top
#           users_sign_up GET    /users/sign_up(.:format)        devise/sessions#new
#                   about GET    /homes/about(.:format)          homes#about
# post_image_post_comments POST   /post_images/:post_image_id/post_comments(.:format)        post_comments#create
# post_image_post_comment DELETE /post_images/:post_image_id/post_comments/:id(.:format)    post_comments#destroy
#             post_images GET    /post_images(.:format)       post_images#index
#                         POST   /post_images(.:format)        post_images#create
#           new_post_image GET    /post_images/new(.:format)    post_images#new
#               post_image GET    /post_images/:id(.:format)    post_images#show
#                         DELETE /post_images/:id(.:format)    post_images#destroy
#               edit_user GET    /users/:id/edit(.:format)     users#edit
#                     user GET    /users/:id(.:format)          users#show
#                         PATCH  /users/:id(.:format)          users#update
#                         PUT    /users/:id(.:format)          users#update
# post_image_favorite DELETE /post_images/:post_image_id/favorite(.:format)        favorites#destroy
#                     POST   /post_images/:post_image_id/favorite(.:format)          favorites#create