class Session < ActiveRecord::Base
  
  validates :code, presence: true, uniqueness: true
  
  before_validation :set_code, on: :create
  
  after_create :create_fixtures
  
  has_many :cards, inverse_of: :session
  has_many :patterns, inverse_of: :session
  
  def to_param
    code
  end
  
  private
  
  def set_code
    self.code = SecureRandom.urlsafe_base64(8)
  end
  
  def create_fixtures

    Pattern.create!(title: 'Blue lines', css: <<-CSS.strip_heredoc)
      background: linear-gradient(0deg, rgba(255,255,255,0.2) 50%, rgba(0,0,0,0) 50%, rgba(0,0,0,0) 0), rgb(0, 170, 238);
      background-position: auto auto;
      background-origin: padding-box;
      background-clip: border-box;
      background-size: 54px auto;
    CSS
    
    Pattern.create!(title: 'Green stripes', css: <<-CSS.strip_heredoc)
      background: linear-gradient(45deg, rgba(255,255,255,0.2) 25%, rgba(0,0,0,0) 25%, rgba(0,0,0,0) 50%, rgba(255,255,255,0.2) 50%, rgba(255,255,255,0.2) 75%, rgba(0,0,0,0) 75%, rgba(0,0,0,0) 0), rgb(170, 204, 0);
      background-position: auto auto;
      background-origin: padding-box;
      background-clip: border-box;
      background-size: 50px 50px;
    CSS
    
    Pattern.create!(title: 'Fire mosaic', css: <<-CSS.strip_heredoc)
      background: linear-gradient(0deg, rgba(255,0,102,0) 20%, rgba(255,0,102,0.0980392) 20%, rgba(255,0,102,0.0980392) 40%, rgba(255,0,102,0.2) 40%, rgba(255,0,102,0.2) 60%, rgba(255,0,102,0.4) 60%, rgba(255,0,102,0.4) 80%, rgba(255,0,102,0.6) 80%), linear-gradient(-90deg, rgba(255,0,102,0) 20%, rgba(255,0,102,0.0980392) 20%, rgba(255,0,102,0.0980392) 40%, rgba(255,0,102,0.2) 40%, rgba(255,0,102,0.2) 60%, rgba(255,0,102,0.4) 60%, rgba(255,0,102,0.4) 80%, rgba(255,0,102,0.6) 80%), rgb(255, 204, 0);
      background-position: auto auto;
      background-origin: padding-box;
      background-clip: border-box;
      background-size: 100% 100%;
    CSS    
    
    Pattern.create!(title: 'Stars', css: <<-CSS.strip_heredoc)
      background: linear-gradient(324deg, rgb(67,20,72) 4%, rgba(0,0,0,0) 4%), linear-gradient(36deg, rgb(67,20,72) 4%, rgba(0,0,0,0) 4%), linear-gradient(72deg, rgb(227,215,191) 8.5%, rgba(0,0,0,0) 8.5%), linear-gradient(288deg, rgb(227,215,191) 8.5%, rgba(0,0,0,0) 8.5%), linear-gradient(216deg, rgb(227,215,191) 7.5%, rgba(0,0,0,0) 7.5%), linear-gradient(144deg, rgb(227,215,191) 7.5%, rgba(0,0,0,0) 7.5%), linear-gradient(324deg, rgb(67,20,72) 4%, rgba(0,0,0,0) 4%), linear-gradient(36deg, rgb(67,20,72) 4%, rgba(0,0,0,0) 4%), linear-gradient(72deg, rgb(227,215,191) 8.5%, rgba(0,0,0,0) 8.5%), linear-gradient(288deg, rgb(227,215,191) 8.5%, rgba(0,0,0,0) 8.5%), linear-gradient(216deg, rgb(227,215,191) 7.5%, rgba(0,0,0,0) 7.5%), linear-gradient(144deg, rgb(227,215,191) 7.5%, rgba(0,0,0,0) 7.5%), rgb(67, 20, 72);
      background-position: -70px 43px, 30px 43px, 30px 43px, -70px 43px, -70px 23px, 30px 23px, -20px 93px, 80px 93px, 80px 93px, -20px 93px, -20px 73px, 80px 73px;
      background-origin: padding-box;
      background-clip: border-box;
      background-size: 100px 100px;
    CSS
    
    patterns = Pattern.all.to_a

    (0..15).each do |i|
      pattern = patterns[i % patterns.length]
      Card.create!(
        title: Faker::Company.catch_phrase,
        body: Faker::Lorem.paragraphs(7).join("\n\n"),
        pattern: pattern,
        session: session
      )
    end
    
  end

end
