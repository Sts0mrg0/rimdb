module Rimdb
  module List

    def all(user_id)
      page = 1
      until document.empty?
        document.fetch(user_id, page)
      end
    end

  end
end
