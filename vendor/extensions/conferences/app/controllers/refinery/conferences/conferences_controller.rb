module Refinery
  module Conferences
    class ConferencesController < ::ApplicationController

      before_filter :find_all_conferences
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @conference in the line below:
        present(@page)
      end

      def show
        @conference = Conference.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @conference in the line below:
        present(@page)
      end

    protected

      def find_all_conferences
        @conferences = Conference.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/conferences").first
      end

    end
  end
end
