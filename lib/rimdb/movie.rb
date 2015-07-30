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

    def <=>(other)
      title <=> other.title
    end

    def to_s
      "Movie<#{object_id}> #{title}"
    end

    def to_h
      instance_variables.reduce({}) do |acc, var|
        key = var.to_s.delete '@'
        acc.merge({ key.to_sym => instance_variable_get(var) })
      end
    end

  end
end
