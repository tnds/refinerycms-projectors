module Refinery
  module Projectors
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Projectors

      engine_name :refinery_projectors

      initializer "register refinerycms_projectors plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "projectors"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.projectors_admin_projectors_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/projectors/projector',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Projectors)
      end
    end
  end
end
