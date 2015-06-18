module Rimdb
  class Movie

    DEFAULT = 'Unknown'

    attr_reader :title, :year

    def initialize(details)
      @title = details[:title]
      @year = details.fetch(:year, DEFAULT)
    end

  end
end
