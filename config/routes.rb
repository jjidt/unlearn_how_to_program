Rails.application.routes.draw do
  match('/lessons/new', :via => :get, :to => 'lessons#new')
  match('/lessons/create', :via => :post, :to => 'lessons#create')
end
