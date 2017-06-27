Rails.application.routes.draw do
  get "/check_password" => "password#check"
  get "/index" => "password#index"

  root "password#index"
end
