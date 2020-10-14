class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.has_director director
    return nil if director.blank? or director.nil?
    Movie.where(:director => director)
  end

end
