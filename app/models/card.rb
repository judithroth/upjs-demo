class Card < ActiveRecord::Base
  
  belongs_to :session, inverse_of: :cards
  belongs_to :pattern, inverse_of: :cards

  validates_presence_of :title, :body, :pattern_id
  
  scope :ordered, -> { order('cards.created_at DESC, cards.id DESC') }

  def pattern_css
    pattern.inline_css
  end
  
end