class Session < ActiveRecord::Base
  
  validates :code, presence: true, uniqueness: true
  
  before_validation :set_code, on: :create
  
  after_create :create_fixtures
  
  has_many :cards, inverse_of: :session
  has_many :patterns, inverse_of: :session
  
  has_defaults up_enabled: true
  
  def to_param
    code
  end
  
  private
  
  def set_code
    self.code = SecureRandom.urlsafe_base64(8)
  end
  
  def create_fixtures
    Fixtures.create(self)
  end

end
