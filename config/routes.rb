Rails.application.routes.draw do
  get 'ticket_types/new'
  get 'ticket_types/create'
  get 'ticket_types/update'
  get 'ticket_types/destroy'
  get 'ticket_types/show'
  get 'event_venues/new'
  get 'event_venues/create'
  get 'event_venues/update'
  get 'event_venues/destroy'
  get 'event_venues/show'
  get 'tickets/create'
  get 'tickets/destroy'
  get 'tickets/update'
  get 'tickets/new'
  get 'tickets/show'
  get 'events/new'
  get 'events/create'
  get 'events/update'
  get 'events/destroy'
  get 'events/show'
  get 'users/new'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  get 'users/show'

  resources :users
  resources :events
  resources :tickets
  resources :event_venues
  resources :ticket_types do
  	resources :tickets
  end

  res

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
