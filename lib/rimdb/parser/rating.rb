module Rimdb
  module Parser
    module Rating
      include Parser

      protected
        def movies_selector
          '.list_item'
        end

        def title(movie_el)
          movie_el.css('a')[1].text
        end

        def year(movie_el)
          movie_el.css('.year_type').first.text.gsub(/\(|\)/, '')
        end

        def rating(movie_el)
          movie_el.css('.rating-your .value').text
        end

        def blurb(movie_el)
          movie_el.css('.info .item_description').text
        end

    end
  end
end
