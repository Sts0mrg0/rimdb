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
          movie_el.css('.year_type').first.text
        end

    end
  end
end
