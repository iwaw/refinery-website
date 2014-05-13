module Refinery
  module Workshops
    class WorkshopsController < ::ApplicationController

      before_filter :find_all_workshops
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @workshop in the line below:
        present(@page)
      end

      def show
        @workshop = Workshop.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @workshop in the line below:
        present(@page)
      end

    protected

      def find_all_workshops
        @workshops = Workshop.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/workshops").first
      end

    end
  end
end
