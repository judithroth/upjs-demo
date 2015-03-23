module ApplicationHelper
  
  def javascript_manifest
    if @session.nil? || @session.up_enabled?
      'application_up'
    else
      'application_classic'
    end
  end
  
end
