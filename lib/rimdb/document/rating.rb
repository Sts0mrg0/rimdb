require 'uri'

module Rimdb
  module Document
    class Rating < Base
      include Parser::Rating

      def url(page)
        url_parts = {
          host: 'www.imdb.com',
          path: "/user/#@user_id/ratings",
          query: "sort=ratings_date:desc&start=#{page}"
        }
        URI::HTTP.build(url_parts)
      end

    end
  end
end

