module Refinery
  module Projectors
    class Projector < Refinery::Core::BaseModel
      self.table_name = 'refinery_projectors'

      attr_accessible :name, :page, :zoom, :position, :position, :interval, :refresh

      acts_as_indexed :fields => [:name, :page]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
