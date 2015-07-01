module Rimdb
  class Movie

    DEFAULT = 'Unknown'

    attr_reader :title, :year, :rating, :blurb, :cover

    def initialize(details)
      @title  = details[:title]
      @year   = details.fetch(:year, DEFAULT)
      @rating = details.fetch(:rating, DEFAULT)
      @blurb  = details.fetch(:blurb, DEFAULT)
      @cover  = details.fetch(:cover, DEFAULT)
    end

  end
end
