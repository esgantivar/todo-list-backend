Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  namespace :api do
    namespace :v1 do
      resources :user, only: [:show, :create] do
        resources :list do
          resources :item
        end
      end
    end
  end
end
