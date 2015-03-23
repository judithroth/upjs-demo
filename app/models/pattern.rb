class Pattern < ActiveRecord::Base
  include Memoizer
  SEQUENCE_FIELD = :id
  
  belongs_to :session, inverse_of: :patterns
  has_many :cards, inverse_of: :pattern
  
  has_defaults author: 'Unknown author'
  
  validates_presence_of :title, :css
  
  scope :sequenced, -> { order(SEQUENCE_FIELD) }
  
  memoize def next
    self.class.sequenced.where("#{SEQUENCE_FIELD} > ?", position_in_sequence).first
  end

  memoize def previous
    self.class.sequenced.where("#{SEQUENCE_FIELD} < ?", position_in_sequence).last
  end
  
  def position_in_sequence
    send(SEQUENCE_FIELD)
  end

  def inline_css
    css.gsub(/\n/, ' ')
  end

end
