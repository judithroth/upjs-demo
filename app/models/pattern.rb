class Pattern < ActiveRecord::Base
  
  belongs_to :session, inverse_of: :patterns
  has_many :cards, inverse_of: :pattern
  
  validates_presence_of :title, :css

  def inline_css
    css.gsub(/\n/, ' ')
  end

end
