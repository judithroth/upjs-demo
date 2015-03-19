class Card < ActiveRecord::Base
  
  belongs_to :session, inverse_of: :cards
  belongs_to :pattern, inverse_of: :cards

  validates_presence_of :title, :body
  
end