Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  resources :semesters do
    resources :courses
  end
  get '/courses' => 'courses#all_index'

  get '/dashboard' => 'users#dashboard'
  get '/enrollments' => 'users#enrollments'
  get '/enrollments/new' => 'users#new'
  match 'enrollments/new' => 'users#savenew', via: :post
end
