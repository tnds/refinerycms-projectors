module Refinery
  module Projectors
    class ProjectorsController < ::ApplicationController
      
      layout "projector", :only => [:show]

      before_filter :find_all_projectors
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @projector in the line below:
        present(@page)
      end

      def show
        @projector = Projector.find(params[:id])
        @page = Refinery::Page.find_by_path(@projector.page) || Refinery::Page.first
        if @projector.refresh then
          @projector.refresh = false
          @projector.save
        end

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @projector in the line below:
        present(@page)
      end
      
      def trigger
        @projector = Projector.find(params[:id])

        respond_to do |format|
          format.js
        end        
      end

    protected

      def find_all_projectors
        @projectors = Projector.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/projectors").first
      end

    end
  end
end
