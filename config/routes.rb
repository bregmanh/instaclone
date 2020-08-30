Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  get '/upload', to: 'images#new'
  get '/@:username', to: 'users#show', as: :profile
  
  resources :images, only: [:index, :show, :create, :delete]

  resources :images do
    member do
    delete :delete_image_attachment
    end
  end




 
  
end
