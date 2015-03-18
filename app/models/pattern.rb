class Pattern < ActiveRecord::Base
  
  belongs_to :session, inverse_of: :patterns
  
  validates_presence_of :name, :css
  
end