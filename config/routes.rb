Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/authenticate", to: "sessions#authenticate"
  get "/back_home", to: "sessions#authenticate"
  get "/auth/github/callback", to: "sessions#create"
  get '/auth/failure', to: redirect('https://git-wired.herokuapp.com/')

  namespace :api do
    namespace :v1 do
      namespace :repositories do
        get '/:repository_id/issues', to: 'issues#index'
        get '/', to: 'repositories#index'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :repositories, module: :repositories, only: %i[index show] do
        resources :projects, only: %i[index show]
        resources :wireframes, only: %i[index show]
      end
    end
  end

end
