Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  namespace :api do
    post 'auth' => 'user_token#create'
    namespace :v1 do
      resources :user, only: [:show, :create] 
      resources :list, except: [:new, :edit] do
        resources :item, except: [:new, :edir]
      end
    end
  end
end
