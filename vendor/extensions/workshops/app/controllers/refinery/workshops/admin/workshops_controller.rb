module Refinery
  module Workshops
    module Admin
      class WorkshopsController < ::Refinery::AdminController

        crudify :'refinery/workshops/workshop',
                :xhr_paging => true

      end
    end
  end
end
