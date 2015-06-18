require 'open-uri'

module Rimdb
  module Document

    def self.fetch(url)
      res = open(url)
      status_code = res.status.first

      if status_code == '404'
        raise DocumentNotFoundError.new('The document could not be found')
      elsif status_code != '200'
        raise DocumentError.new("Request received status code #{status_code}")
      end

      Nokogiri::HTML(res.read)
    end

    def self.to_file(path)
      content = fetch
      File.open(path, 'w+') do |file|
        file.write content
      end
    end

  end

  class DocumentError < StandardError; end;
  class DocumentNotFoundError < DocumentError; end;
end
