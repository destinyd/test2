Zhekou::Application.routes.draw do

  get "attrs/index"

  get "attrs/show"

  get "attrs/create"

  get "attrs/review"

  resources :reviews

  resources :userhomes do
    collection do
      get :integrals
    end
  end
  resources :flashes

  resources :articles do
    resources :comments
    resources :complaints
    resources :reviews do
      collection do
        get :up
      end
    end
  end

  #resources :complaints

  resources :focus

  resources :goods do
    resources :comments
    resources :uploads
    resources :complaints
    resources :reviews do
      collection do
        get :up
      end
    end
    resources :prices
    resources :focus
    resources :attrs,:only => [:index,:show,:create,:review]
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

  #resources :complaints

  resources :prices do
    resources :comments
    resources :complaints
    resources :reviews do
      collection do
        get :up
      end
    end
  end

  resources :categories do
    resources :goods
    resources :focus
    resources :articles
  end


  
  root :to => "home#index"
  match "/:reviewable_type/:reviewable_id/reviews/:action" => "reviews#:action",:as => 'reviewable'

#  match "/users/sign_out(.:format)",:controller => 'users/sessions',:action => :destroy,:as => 'destroy_user_session'
  
end
