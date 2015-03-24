class CardsController < ApplicationController
  
  def show
    load_cards
    load_card
  end
  
  def index
    load_cards
    @card = @cards.first
    render 'show'
  end
  
  def edit
    load_card
    build_card
  end
  
  def update
    edit
    if @card.save
      redirect_to [@session, @card]
    else
      render :edit, status: :bad_request
    end
  end
  
  private
  
  def load_cards
    @cards ||= card_scope.ordered.paginate(page: params[:page], per_page: 15).to_a
  end
  
  def load_card
    @card ||= card_scope.find(params[:id])
  end
  
  def build_card
    @card.attributes = card_params
  end
  
  def card_scope
    @session.cards
  end
  
  def card_params
    card_params = params[:card]
    card_params ? card_params.permit(:title, :body, :pattern_id) : {}
  end

end
