Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :workshops do
    resources :workshops, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :workshops, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :workshops, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
