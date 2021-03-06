Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  resources :semesters do
    resources :courses do
      resources :assignments
    end
  end
  get '/courses' => 'courses#all_index'

  get '/courses/most_students' => 'courses#most_students'

  get '/dashboard' => 'users#dashboard'
  get '/enrollments' => 'users#enrollments'
  get '/enrollments/new' => 'users#new'
  match 'enrollments/new' => 'users#savenew', via: :post
  resources :grades
  get '/assignments' => 'assignments#all_index'
  post '/assignments' => 'assignments#all_index'


end
