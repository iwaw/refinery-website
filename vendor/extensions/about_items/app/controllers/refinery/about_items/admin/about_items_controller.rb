module Refinery
  module AboutItems
    module Admin
      class AboutItemsController < ::Refinery::AdminController

        crudify :'refinery/about_items/about_item',
                :xhr_paging => true

      end
    end
  end
end
