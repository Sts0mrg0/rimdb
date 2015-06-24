require 'spec_helper'

describe 'Document' do

  it 'should return a Nokogiri document when successful' do
    url = 'http://some-valid-url.com'
    stub_request(:get, url)
      .to_return(body: Utils.load_fixture('ratings_page.html'))
    document = Rimdb::Document.fetch(url)
    expect(document).to be_an_instance_of Nokogiri::HTML::Document
  end

  it 'should raise a 404 error when not found' do
    url = 'http://some-non-existing-url.com'
    stub_request(:get, url)
      .to_return(status: 404, body: 'Not found')
    expect {
      Rimdb::Document.fetch(url)
    }.to raise_error Rimdb::DocumentFetchError
  end

  it 'should raise a DocumentError for unknown error codes' do
    url = 'http://some-invalid-url.com'
    stub_request(:get, url)
      .to_return(status: 500, body: 'Uh oh')
    expect {
      Rimdb::Document.fetch(url)
    }.to raise_error Rimdb::DocumentFetchError
  end

end
