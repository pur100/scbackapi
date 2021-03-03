Rails.application.routes.draw do
  namespace :admin do
      resources :contacts
      resources :invoices
      resources :users
      root to: "contacts#index"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post :login, to: 'login#create'
  delete :login, to: 'login#destroy'
  delete 'login/destroy_by_refresh', to: 'login#destroy_by_refresh', as: :destroy_by_refresh
  post :login_with_cookies, to: 'login_with_cookies#create'
  post :refresh, to: 'refresh#create'
  post :refresh_by_access, to: 'refresh_by_access#create'

 resources :users, only: [:show, :create] do
   get :debtors, to: 'debtors#user_index'
 end

 # get '/', to: 'invoices#index'

 resources :contacts, except: [:destroy, :update]
 resources :invoices
 resources :debtors do
   get :invoices, to: 'invoices#debtor_index'
 end

end
