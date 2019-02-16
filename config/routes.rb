Rails.application.routes.draw do

  get "/authenticate", to: "sessions#authenticate"
  get "/back_home", to: "sessions#authenticate"
  get "/auth/github/callback", to: "sessions#create"
  get '/auth/failure', to: redirect('https://git-wired.herokuapp.com/')
end
