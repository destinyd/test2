Zhekou::Application.routes.draw do

  resources :reviews
  resources :attrs,:only => [:new] do
    resources :reviews
  end

  resources :userhomes do
    collection do
      get :integrals
    end
  end
  resources :flashes

  resources :articles do
    resources :comments
    resources :reviews
  end

  resources :focus

  resources :goods do
    resources :comments
    resources :uploads
    resources :reviews
    resources :prices
    resources :focus
    resources :attrs,:only => [:index,:show,:create,:new] do
      resources :reviews
    end
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

  resources :prices do
    resources :comments
    resources :reviews
  end

  
  root :to => "home#index"
  match "/:reviewable_type/:reviewable_id/reviews/:action" => "reviews#:action",:as => 'reviewable'

#  match "/users/sign_out(.:format)",:controller => 'users/sessions',:action => :destroy,:as => 'destroy_user_session'
  
end
