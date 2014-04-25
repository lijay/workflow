Workflow::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #root :to => 'high_voltage/pages#show', :id => 'welcome'
  root :to => 'projects#index'

  resources :projects do
  	resources :steps do
  		get 'finish', :on => :member
  		get 'content', :on => :member

  		resources :items do
        get 'check', :on => :member
        get 'uncheck', :on => :member
      end
  	end
  end
end
