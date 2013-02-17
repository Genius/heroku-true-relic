ActionController::Routing::Routes.draw do |map|
  map.connect '/', :controller => :dummy, :action => :index
  map.connect 'env/:var', :controller => :env, :action => :show
end
