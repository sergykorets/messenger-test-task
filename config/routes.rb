Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'welcome#index'

  get "application/refresh_nav" => "application#refresh_nav"
  get "conversations/remove" => "conversations#remove"
  # mailbox folder routes
  #get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox

  # conversations
  resources :conversations do
    member do
      post :reply
    end
  end

end
