class Pattern < ActiveRecord::Base
  include Memoizer
  SEQUENCE_FIELD = :id
  
  belongs_to :session, inverse_of: :patterns
  has_many :cards, inverse_of: :pattern
  
  has_defaults author: 'Unknown author'
  
  validates_presence_of :title, :css
  
  def sequence
    session.patterns.order(SEQUENCE_FIELD)
  end
  
  memoize def next
    sequence.where("#{SEQUENCE_FIELD} > ?", position_in_sequence).first || sequence.first
  end

  memoize def previous
    sequence.where("#{SEQUENCE_FIELD} < ?", position_in_sequence).last || sequence.last
  end
  
  def position_in_sequence
    send(SEQUENCE_FIELD)
  end

  def inline_css
    css.gsub(/\n/, ' ')
  end

end
