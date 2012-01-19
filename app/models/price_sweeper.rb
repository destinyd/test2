class PriceSweeper < ActionController::Caching::Sweeper
  # Listen to events from price
  observe Price

  # If a price is created
  def after_create(price)
     expire_page :action => :index
     expire_page :action => :show,:id => price.id
     expire_page :controller => 'home', :action => 'index'
  end

  # If an price is updated
  def after_update(price)
     expire_page :action => :index
     expire_page :action => :show,:id => price.id
     expire_page :controller => 'home', :action => 'index'
  end

  # If an price is destroyed
  def after_destroy(price)
     expire_page :action => :index
     expire_page :action => :show,:id => price.id
     expire_page :controller => 'home', :action => 'index'
  end
end
