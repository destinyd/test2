Zhekou::Application.routes.draw do

  resources :flashes

  resources :articles do
    resources :comments
  end

  resources :focus

  resources :goods do
    resources :comments
    resources :uploads
  end

  get "home/index"

  resources :uploads#,:only  =>  [:show]

  devise_for :users     , :controllers => { :sessions => "users/sessions" }
#  devise_scope :user do
#    get "sign_out", :to => "users/sessions#destroy"
#  end

#  get '/users/sign_out(.:format)',:to => 'users/sessions#destroy'

  resources :records

  resources :outlinks

  resources :msgs

  resources :complaints

  resources :goods do
    resources :prices
    resources :focus
  end
  
    resources :prices do
      resources :comments
    end

  resources :categories do
    resources :goods
    resources :focus
    resources :articles
  end

  resources :prices
  

#  resources :integrals

#  resources :users do
#    resources :integrals
#  end
  
  root :to => "home#index"

#  match "/users/sign_out(.:format)",:controller => 'users/sessions',:action => :destroy,:as => 'destroy_user_session'
  
end
