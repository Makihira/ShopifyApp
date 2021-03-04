Rails.application.routes.draw do

  resources :answers
  resources :questions
  resources :mycontacts

  get 'messages/index'
  get 'messages/show'
  get 'messages/add'
  get 'messages/edit'
  get 'sneakers/index'
  get 'sneakers/show'
  get 'sneakers/add'
  get 'sneakers/edit'
  #Msgboardクラス
  get 'msgboard', to: 'msgboard#index'
  post 'msgboard', to: 'msgboard#index'
  get 'msgboard/index'
  post 'msgboard/index'

  #Peopleクラス
  get 'people/index'
  get 'people', to: 'people#index'
  get 'people/add'
  post 'people/add', to: 'people#create'
  get 'people/edit/:id', to: 'people#edit'
  post 'people/edit/:id', to: 'people#update'
  patch 'people/edit/:id', to: 'people#update'
  get 'people/delete/:id', to: 'people#delete'
  get 'people/find'
  post 'people/find'
  get 'people/:id', to: 'people#show'

  #Sneakerクラス
  get 'sneakers/index'
  get 'sneakers', to: 'sneakers#index'
  get 'sneakers/add'
  post 'sneakers/add'
  get 'sneakers/:id', to:'sneakers#show'
  get 'sneakers/edit/:id', to:'sneakers#edit'
  patch 'sneakers/edit/:id', to:'sneakers#edit'
  get 'sneakers/delete/:id', to:'sneakers#delete'

  #Messageクラス
  get 'messages/index'
  get 'messages', to:'messages#index'
  get 'messages/add'
  post 'messages/add', to:'messages#create'
  get 'messages/edit/:id', to:'messages#edit'
  patch 'messages/edit/:id', to:'messages#update'
  get 'messages/delete/:id', to:'messages#delete'
  get 'messages/:id', to:'messages#show'


end
