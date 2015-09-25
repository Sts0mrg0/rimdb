require 'open-uri'

module Rimdb
  module Document
    class Base

      attr_reader :user_id, :html

      def initialize(user_id)
        @user_id = user_id
      end

      def get(page = 1)
        @html = fetch(url(page))
      end

      def empty?
        @html.respond_to? :css and
          @html.css('.list.detail').children.select(&:element?).empty?
      end

      protected
        def url(page = 1); end;

      private
        def fetch(url)
          res = open(url)
          Nokogiri::HTML(res.read)
        rescue OpenURI::HTTPError => e
          raise DocumentFetchError.new "Failed to connect. Status: #{e.message}"
        rescue StandardError => e
          raise DocumentFetchError.new "Fatal error connecting to #{url}: #{e.message}"
        end

    end
  end
end
