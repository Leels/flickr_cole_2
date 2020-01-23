Rails.application.routes.draw do
    root to: 'homes#index'
    get '/register' => 'users#new'
    post '/users' => 'users#create'

    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    get '/signout' => 'sessions#destroy'

    get    '/:username(.:format)', to: 'users#show', as: 'user'
    get    '/:username(.:format)/edit' => 'users#edit'
    patch  '/:username(.:format)' => 'users#update'
    put    '/:username(.:format)' => 'users#update'
    delete '/:username(.:format)' => 'users#destroy'


    scope '/:username(.:format)' do
        resources :albums do
            resources :photos
        end
    end
end
