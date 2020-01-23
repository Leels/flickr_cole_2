Rails.application.routes.draw do
    root to: 'homes#index'

    #registration
    get '/register',           to: 'users#new',         as: 'new_user'
    post '/users',             to: 'users#create'

    #sign-in / out
    get '/signin',             to: 'sessions#new',      as: 'new_session'
    post '/signin',            to: 'sessions#create'
    get '/signout',            to: 'sessions#destroy',  as: 'destroy_session'
    
    #user paths
    get    '/:username',       to: 'users#show',        as: 'user'
    get    '/:username/edit',  to: 'users#edit',        as: 'edit_user'
    patch  '/:username',       to: 'users#update'
    put    '/:username',       to: 'users#update'
    delete '/:username',       to: 'users#destroy'

    #nested resource paths
    scope path: '/:username', as: 'user' do
        resources :albums, except: [:index] do
            resources :photos, except: [:index]
        end
    end
end
