Workflow::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #root :to => 'high_voltage/pages#show', :id => 'welcome'
  root :to => 'projects#index'

  resources :projects do
  	resources :steps do
  		get 'finish', :on => :member
  	end
  end
end
