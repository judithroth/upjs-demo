class SessionsController < ApplicationController
  
  def create
    session = Session.create!
    redirect_to session_card_path(session, session.cards.ordered.first)
  end

end
