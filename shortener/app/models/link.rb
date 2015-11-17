class Link < ActiveRecord::Base

  def self.search_by_short(shortlink)
    find_by(short_url: shortlink)
  end

  def self.random_string(number)
    arr = (0...number).map do |num|
      r = rand(2)
      if r == 0
        (65 +rand(26)).chr
      else
        (97 + rand(26)).chr
      end
    end
    string = arr.join
  end
end
