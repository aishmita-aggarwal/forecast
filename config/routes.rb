Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resource :weather, only: :show, controller: :weather
    end
  end

  root to: 'api/v1/weather#show'

end
