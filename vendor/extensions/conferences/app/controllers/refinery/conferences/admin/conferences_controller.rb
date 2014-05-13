module Refinery
  module Conferences
    module Admin
      class ConferencesController < ::Refinery::AdminController

        crudify :'refinery/conferences/conference',
                :xhr_paging => true

      end
    end
  end
end
