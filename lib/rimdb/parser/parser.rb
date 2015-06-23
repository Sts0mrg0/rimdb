module Rimdb
  module Parser

    def movies
      @movies ||= @document.css(movies_selector).map do |movie_el|
        Movie.new({
          title: self.title(movie_el),
          year: self.year(movie_el),
          rating: self.rating(movie_el)
        })
      end
    end

    def each_movie
      @movies.each { |movie| yield movie }
    end

  end
end
