Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :conferences do
    resources :conferences, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :conferences, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :conferences, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
