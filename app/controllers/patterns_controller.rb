class PatternsController < ApplicationController
  
  def show
    load_session
    load_pattern
  end
  
  private

  def load_session
    @session ||= Session.where(code: params[:session_id]).first!
  end
  
  def load_pattern
    @pattern ||= pattern_scope.find(params[:id])
  end
  
  def pattern_scope
    @session.patterns
  end

end
