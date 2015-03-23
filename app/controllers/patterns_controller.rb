class PatternsController < ApplicationController
  
  def show
    load_session
    load_pattern
    load_card
  end
  
  private

  def load_session
    @session ||= Session.where(code: params[:session_id]).first!
  end
  
  def load_pattern
    @pattern ||= pattern_scope.find(params[:id])
  end
  
  def load_card
    @card ||= card_scope.find(params[:card_id]) if params[:card_id]
  end
  
  def pattern_scope
    @session.patterns
  end
  
  def card_scope
    @session.cards
  end

end
