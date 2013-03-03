Refinery::Projectors::ProjectorsController.class_eval do
  
  after_filter :set_refresh, :only => [:update]
  
  protected
  
#    def set_refresh
#      @projector = Projector.find(params[:id])
#      unless(@projector.refresh) then
#        @projector.refresh = true
#        @projector.save
#      end
#    end
end