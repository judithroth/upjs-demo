class CardsController < ApplicationController
  
  def index
    load_session
    load_cards
    @card = @cards.first
    render 'show'
  end
  
  def show
    load_session
    load_cards
    load_card
  end
  
  def edit
    load_session
    load_card
    build_card
  end
  
  def create
    load_session
    load_card
    build_save
    if @card.save
      redirect_to [@session, @card]
    else
      render :edit
    end
  end
  
  private
  
  def load_session
    @session ||= Session.where(code: params[:session_id]).first!
  end
  
  def load_cards
    @cards ||= card_scope.paginate(page: params[:page], per_page: 20).to_a
  end
  
  def load_card
    @card ||= card_scope.find(params[:id])
  end
  
  def card_scope
    @session.cards
  end

end
