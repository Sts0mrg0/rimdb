module Rimdb
  class Movie

    DEFAULT = 'Unknown'

    attr_reader :title, :year, :rating, :blurb

    def initialize(details)
      @title  = details[:title]
      @year   = details.fetch(:year, DEFAULT)
      @rating = details.fetch(:rating, DEFAULT)
      @blurb  = details.fetch(:blurb, DEFAULT)
    end

  end
end
