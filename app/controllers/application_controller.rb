class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_session
  before_filter :enable_or_disable_up
  
  private
  
  def load_session
    if params[:session_id].present?
      @session = Session.where(code: params[:session_id]).first!
    end
  end
  
  def enable_or_disable_up
    unless @session.nil? || params[:up_enabled].nil?
      @session.update_attributes!(up_enabled: params[:up_enabled])
    end
  end

end
