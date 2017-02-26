Rails.application.routes.draw do

  get 'campaigns' => 'campaigns#index'
  get 'campaigns/:id', to: 'campaigns#show', as: 'campaign'

  root 'campaigns#index'

end
