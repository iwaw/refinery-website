module Refinery
  module AboutItems
    class AboutItem < Refinery::Core::BaseModel
      self.table_name = 'refinery_about_items'

      attr_accessible :title, :info, :photo_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
