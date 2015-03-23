class PatternsController < ApplicationController
  
  def show
    load_pattern
  end
  
  private

  def load_pattern
    @pattern ||= pattern_scope.find(params[:id])
  end
  
  def pattern_scope
    @session.patterns
  end

end
