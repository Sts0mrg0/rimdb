module Rimdb
  class Ratings
    include Parser::Rating

    URL = 'http://www.imdb.com/user/%s/ratings'

    def initialize(user_id)
      @document = Rimdb::Document.fetch(URL % user_id)
    end

  end
end
