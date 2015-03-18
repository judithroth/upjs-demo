class SessionsController < ApplicationController
  
  def create
    session = Session.create!
    redirect_to session_cards_path(session)
  end

end
