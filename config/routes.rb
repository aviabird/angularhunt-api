require 'api_constraint'

Rails.application.routes.draw do
  get 'home/index'

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v0, constraints: ApiConstraint.new(version: 0, default: true) do

      post 'auth/:provider', to: 'auth#authenticate'
      post 'users/user_detail', to: 'users#user_detail'
      get 'projects/all_projects', to: 'projects#all_projects'
      post 'projects/upvote', to: 'projects#upvote'
    end
  end
end
