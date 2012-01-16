Zhekou::Application.routes.draw do
  resources :locates,:only => [:index,:show,:create,:new]
  resources :cities,:only => [:index,:show] do
    resources :prices do
      collection do
        get :cheapest
        get :groupbuy
        get :costs
      end
    end
  end


  match '/prices/local' => redirect('/prices/costs')
  resources :user_infos

  resources :my_tasks

  resources :user_tasks

  resources :tasks

  resources :price_goods

  resources :prices,:only => [:index,:show,:new,:create] do
    collection do
      get :cheapest
      get :groupbuy
      get :costs
    end
  end
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

  resources :outlinks do
    resources :reviews
  end

  resources :focus

  resources :goods do
    resources :comments
    resources :uploads
    resources :reviews
    resources :prices,:only => [:index,:show,:new,:create] do
      collection do
        get :cheapest
        get :groupbuy
        get :local
      end
    end

    resources :focus
    resources :outlinks
    resources :attrs,:only => [:index,:show,:create,:new] do
      resources :reviews
    end
    collection do
      get :tags
    end
    member do
      get :tag
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

  resources :msgs

  resources :prices do
    resources :comments
    resources :reviews
    resources :uploads
  end


  root :to => "home#index"
  match "/:reviewable_type/:reviewable_id/reviews" => "reviews#:action",:as => 'reviewable'

  #  match "/users/sign_out(.:format)",:controller => 'users/sessions',:action => :destroy,:as => 'destroy_user_session'

end
