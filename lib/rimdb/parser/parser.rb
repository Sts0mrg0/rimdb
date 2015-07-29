module Rimdb
  module Parser
    include Enumerable

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

    def each(&block)
      movies.each(&block)
    end

  end
end
