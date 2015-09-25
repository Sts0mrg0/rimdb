module Rimdb
  class Ratings
    include Enumerable

    attr_reader :movies

    URL = 'http://www.imdb.com/user/%s/ratings'

    def initialize(user_id)
      @user_id = user_id
      @movies = []
    end

    def fetch
      @document = Rimdb::Document::Rating.new(@user_id)

      page = 1
      until @document.empty?
        @document.get(page)
        @movies.concat @document.movies
        page = page + 100
      end

      self
    end

    def each(&block)
      @movies.each(&block)
    end

  end
end
