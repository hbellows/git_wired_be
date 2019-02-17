Rails.application.routes.draw do

  get "/authenticate", to: "sessions#authenticate"
  get "/back_home", to: "sessions#authenticate"
  get "/auth/github/callback", to: "sessions#create"
  get '/auth/failure', to: redirect('https://git-wired.herokuapp.com/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/projects', to: 'projects#index'
    end
  end
end
