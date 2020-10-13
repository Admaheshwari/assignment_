Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  scope module: 'api', defaults: { format: :json } do
  	namespace :v1 do
  
  		resources :authors, only: :show

  	end
  end

end
