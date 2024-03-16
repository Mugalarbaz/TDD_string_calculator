# config/routes.rb

Rails.application.routes.draw do
  root 'string_calculators#index'
  get 'calculate_string', to: 'string_calculators#new'
  post 'calculate_string', to: 'string_calculators#calculate'
end
