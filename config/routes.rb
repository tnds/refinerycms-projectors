Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :projectors do
    resources :projectors, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :projectors, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :projectors, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
