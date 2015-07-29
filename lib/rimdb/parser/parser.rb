module Rimdb
  module Parser

    def movies
      @movies ||= @document.css(movies_selector).map do |movie_el|
        Movie.new({
          title: title(movie_el),
          year: year(movie_el),
          rating: rating(movie_el),
          blurb: blurb(movie_el),
          cover: cover(movie_el)
        })
      end
    end

    def all
      movies
    end

    def each_movie
      movies.to_enum
    end

  end
end
