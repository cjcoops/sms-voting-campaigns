Rails.application.routes.draw do

  get 'campaigns' => 'campaigns#index'

  root 'campaigns#index'

end
