Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :about_items do
    resources :about_items, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :about_items, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :about_items, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
