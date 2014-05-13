module Refinery
  module Workshops
    class Workshop < Refinery::Core::BaseModel
      self.table_name = 'refinery_workshops'

      attr_accessible :title, :start_date, :end_date, :info, :photo1_id, :photo2_id, :photo3_id, :photo4_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo1, :class_name => '::Refinery::Image'

      belongs_to :photo2, :class_name => '::Refinery::Image'

      belongs_to :photo3, :class_name => '::Refinery::Image'

      belongs_to :photo4, :class_name => '::Refinery::Image'
    end
  end
end
