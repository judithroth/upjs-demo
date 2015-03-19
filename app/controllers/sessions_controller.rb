class SessionsController < ApplicationController
  
  def create
    session = Session.create!
    redirect_to session_card_path(session, session.cards.first)
  end

end
