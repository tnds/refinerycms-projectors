module Refinery
  module Projectors
    module Admin
      class ProjectorsController < ::Refinery::AdminController

        crudify :'refinery/projectors/projector',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
