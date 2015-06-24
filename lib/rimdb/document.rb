require 'open-uri'

module Rimdb
  module Document

    def self.fetch(url)
      res = open(url)
      Nokogiri::HTML(res.read)
    rescue OpenURI::HTTPError => e
      raise DocumentFetchError.new "Failed to connect. Status: #{e.message}"
    rescue StandardError => e
      raise DocumentFetchError.new "Fatal error connecting to #{url}: #{e.message}"
    end

    def self.to_file(path)
      content = fetch
      File.open(path, 'w+') do |file|
        file.write content
      end
    end

  end

  class DocumentFetchError < StandardError; end;
end
