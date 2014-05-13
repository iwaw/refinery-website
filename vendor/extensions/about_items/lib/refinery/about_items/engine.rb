module Refinery
  module AboutItems
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::AboutItems

      engine_name :refinery_about_items

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "about_items"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.about_items_admin_about_items_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/about_items/about_item'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::AboutItems)
      end
    end
  end
end
