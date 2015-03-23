class Fixtures

  def self.create(session)
    ActiveRecord::Base.transaction do

      # session.patterns.create!(title: 'Blue lines', css: <<-CSS.strip_heredoc)
      #   background: linear-gradient(0deg, rgba(255,255,255,0.2) 50%, rgba(0,0,0,0) 50%, rgba(0,0,0,0) 0), rgb(0, 170, 238);
      #   background-position: auto auto;
      #   background-origin: padding-box;
      #   background-clip: border-box;
      #   background-size: 54px auto;
      # CSS

      session.patterns.create!(title: 'Fire mosaic', css: <<-CSS.strip_heredoc)
        background: linear-gradient(0deg, rgba(255,0,102,0) 20%, rgba(255,0,102,0.0980392) 20%, rgba(255,0,102,0.0980392) 40%, rgba(255,0,102,0.2) 40%, rgba(255,0,102,0.2) 60%, rgba(255,0,102,0.4) 60%, rgba(255,0,102,0.4) 80%, rgba(255,0,102,0.6) 80%), linear-gradient(-90deg, rgba(255,0,102,0) 20%, rgba(255,0,102,0.0980392) 20%, rgba(255,0,102,0.0980392) 40%, rgba(255,0,102,0.2) 40%, rgba(255,0,102,0.2) 60%, rgba(255,0,102,0.4) 60%, rgba(255,0,102,0.4) 80%, rgba(255,0,102,0.6) 80%), rgb(255, 204, 0);
        background-position: auto auto;
        background-origin: padding-box;
        background-clip: border-box;
        background-size: 100% 100%;
      CSS

      # session.patterns.create!(title: 'Stars', author: 'Nicolas Gallagher', css: <<-CSS.strip_heredoc)
      #   background:
      #   linear-gradient(324deg, #232927 4%,   transparent 4%) -70px 43px,
      #   linear-gradient( 36deg, #232927 4%,   transparent 4%) 30px 43px,
      #   linear-gradient( 72deg, #e3d7bf 8.5%, transparent 8.5%) 30px 43px,
      #   linear-gradient(288deg, #e3d7bf 8.5%, transparent 8.5%) -70px 43px,
      #   linear-gradient(216deg, #e3d7bf 7.5%, transparent 7.5%) -70px 23px,
      #   linear-gradient(144deg, #e3d7bf 7.5%, transparent 7.5%) 30px 23px,
      #   
      #   linear-gradient(324deg, #232927 4%,   transparent 4%) -20px 93px,
      #   linear-gradient( 36deg, #232927 4%,   transparent 4%) 80px 93px,
      #   linear-gradient( 72deg, #e3d7bf 8.5%, transparent 8.5%) 80px 93px,
      #   linear-gradient(288deg, #e3d7bf 8.5%, transparent 8.5%) -20px 93px,
      #   linear-gradient(216deg, #e3d7bf 7.5%, transparent 7.5%) -20px 73px,
      #   linear-gradient(144deg, #e3d7bf 7.5%, transparent 7.5%) 80px 73px;
      #   background-color: #232927;
      #   background-size: 100px 100px;
      # CSS

      session.patterns.create!(title: 'Green stripes', css: <<-CSS.strip_heredoc)
        background: linear-gradient(45deg, rgba(255,255,255,0.2) 25%, rgba(0,0,0,0) 25%, rgba(0,0,0,0) 50%, rgba(255,255,255,0.2) 50%, rgba(255,255,255,0.2) 75%, rgba(0,0,0,0) 75%, rgba(0,0,0,0) 0), rgb(170, 204, 0);
        background-position: auto auto;
        background-origin: padding-box;
        background-clip: border-box;
        background-size: 50px 50px;
      CSS
      
      session.patterns.create!(title: 'Japenese Cube', css: <<-CSS.strip_heredoc)
        background-color:#556;
        background-image:
          linear-gradient(30deg, #445 12%, transparent 12.5%, transparent 87%, #445 87.5%, #445),
          linear-gradient(150deg, #445 12%, transparent 12.5%, transparent 87%, #445 87.5%, #445),
          linear-gradient(30deg, #445 12%, transparent 12.5%, transparent 87%, #445 87.5%, #445),
          linear-gradient(150deg, #445 12%, transparent 12.5%, transparent 87%, #445 87.5%, #445),
          linear-gradient(60deg, #99a 25%, transparent 25.5%, transparent 75%, #99a 75%, #99a), 
          linear-gradient(60deg, #99a 25%, transparent 25.5%, transparent 75%, #99a 75%, #99a);
        background-size:80px 140px;
        background-position: 0 0, 0 0, 40px 70px, 40px 70px, 0 0, 40px 70px;
      CSS
      
      session.patterns.create!(title: 'Upholstery', author: 'Nate Eagle', css: <<-CSS.strip_heredoc)
        background:
          radial-gradient(hsl(0, 100%, 27%) 4%, hsl(0, 100%, 18%) 9%, hsla(0, 100%, 20%, 0) 9%) 0 0,
          radial-gradient(hsl(0, 100%, 27%) 4%, hsl(0, 100%, 18%) 8%, hsla(0, 100%, 20%, 0) 10%) 50px 50px,
          radial-gradient(hsla(0, 100%, 30%, 0.8) 20%, hsla(0, 100%, 20%, 0)) 50px 0,
          radial-gradient(hsla(0, 100%, 30%, 0.8) 20%, hsla(0, 100%, 20%, 0)) 0 50px,
          radial-gradient(hsla(0, 100%, 20%, 1) 35%, hsla(0, 100%, 20%, 0) 60%) 50px 0,
          radial-gradient(hsla(0, 100%, 20%, 1) 35%, hsla(0, 100%, 20%, 0) 60%) 100px 50px,
          radial-gradient(hsla(0, 100%, 15%, 0.7), hsla(0, 100%, 20%, 0)) 0 0,
          radial-gradient(hsla(0, 100%, 15%, 0.7), hsla(0, 100%, 20%, 0)) 50px 50px,
          linear-gradient(45deg, hsla(0, 100%, 20%, 0) 49%, hsla(0, 100%, 0%, 1) 50%, hsla(0, 100%, 20%, 0) 70%) 0 0,
          linear-gradient(-45deg, hsla(0, 100%, 20%, 0) 49%, hsla(0, 100%, 0%, 1) 50%, hsla(0, 100%, 20%, 0) 70%) 0 0;
        background-color: #300; 
        background-size: 100px 100px;
      CSS      
      
      session.patterns.create!(title: 'Zig-Zag (Blue)', author: 'eCSSpert', css: <<-CSS.strip_heredoc)
        background: 
        linear-gradient(135deg, #2277aa 25%, transparent 25%) -50px 0,
        linear-gradient(225deg, #2277aa 25%, transparent 25%) -50px 0,
        linear-gradient(315deg, #2277aa 25%, transparent 25%),
        linear-gradient(45deg, #2277aa 25%, transparent 25%);	
        background-size: 100px 100px;
        background-color: #115588;
      CSS 
      
      session.patterns.create!(title: 'Starry Night', css: <<-CSS.strip_heredoc)
        background-color:black;
        background-image:
          radial-gradient(white, rgba(255,255,255,.2) 2px, transparent 40px),
          radial-gradient(white, rgba(255,255,255,.15) 1px, transparent 30px),
          radial-gradient(white, rgba(255,255,255,.1) 2px, transparent 40px),
          radial-gradient(rgba(255,255,255,.4), rgba(255,255,255,.1) 2px, transparent 30px);
        background-size: 550px 550px, 350px 350px, 250px 250px, 150px 150px; 
        background-position: 0 0, 40px 60px, 130px 270px, 70px 100px;      
      CSS
      
      session.patterns.create!(title: 'Tartan', author: 'Marta Armada', css: <<-CSS.strip_heredoc)
        background-color: hsl(2, 57%, 40%);
        background-image: repeating-linear-gradient(transparent, transparent 50px, rgba(0,0,0,.4) 50px, rgba(0,0,0,.4) 53px, transparent 53px, transparent 63px, rgba(0,0,0,.4) 63px, rgba(0,0,0,.4) 66px, transparent 66px, transparent 116px, rgba(0,0,0,.5) 116px, rgba(0,0,0,.5) 166px, rgba(255,255,255,.2) 166px, rgba(255,255,255,.2) 169px, rgba(0,0,0,.5) 169px, rgba(0,0,0,.5) 179px, rgba(255,255,255,.2) 179px, rgba(255,255,255,.2) 182px, rgba(0,0,0,.5) 182px, rgba(0,0,0,.5) 232px, transparent 232px),
        repeating-linear-gradient(270deg, transparent, transparent 50px, rgba(0,0,0,.4) 50px, rgba(0,0,0,.4) 53px, transparent 53px, transparent 63px, rgba(0,0,0,.4) 63px, rgba(0,0,0,.4) 66px, transparent 66px, transparent 116px, rgba(0,0,0,.5) 116px, rgba(0,0,0,.5) 166px, rgba(255,255,255,.2) 166px, rgba(255,255,255,.2) 169px, rgba(0,0,0,.5) 169px, rgba(0,0,0,.5) 179px, rgba(255,255,255,.2) 179px, rgba(255,255,255,.2) 182px, rgba(0,0,0,.5) 182px, rgba(0,0,0,.5) 232px, transparent 232px),
        repeating-linear-gradient(125deg, transparent, transparent 2px, rgba(0,0,0,.2) 2px, rgba(0,0,0,.2) 3px, transparent 3px, transparent 5px, rgba(0,0,0,.2) 5px);
      CSS

      patterns = session.patterns.to_a

      (0..100).each do |i|
        pattern = patterns[i % patterns.length]
        session.cards.create!(
          title: Faker::Company.catch_phrase,
          body: (1..20).collect { |i|  Faker::Lorem.sentences(4 + rand(4)).join(" ") }.join("\n\n"),
          pattern: pattern
        )
      end

    end

  end

end