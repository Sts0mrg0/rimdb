module Rimdb
  class Movie

    DEFAULT = 'Unknown'

    attr_reader :title, :year, :rating

    def initialize(details)
      @title = details[:title]
      @year = details.fetch(:year, DEFAULT)
      @rating = details.fetch(:rating, DEFAULT)
    end

  end
end
