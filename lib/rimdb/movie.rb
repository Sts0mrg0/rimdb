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

    def is_movie?
      match = @blurb.match(/\((.*) mins.\)/)
      return true unless match.nil? or match[1].to_i <= 60
    end

  end
end
