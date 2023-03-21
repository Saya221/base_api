Rails.application.routes.draw do
  root to: redirect("/swagger/index.html")

  namespace :api, format: :json do
    namespace :v1 do

      namespace :admin do
        resources :users, only: %i(show)
      end

      post :login, to: "sessions#login"

      get :ping, to: "health_checks#ping"
    end
  end
end
