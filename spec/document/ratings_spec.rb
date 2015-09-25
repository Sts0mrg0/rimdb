require 'spec_helper'

describe 'Ratings Document', focus: true do
  before :each do
    page_1 = /.*\/ratings.*start=1.*/
    page_2 = /.*\/ratings.*start=300.*/

    stub_request(:get, page_1)
      .to_return(body: Utils.load_fixture('ratings_page.html'))
    stub_request(:get, page_2)
      .to_return(body: Utils.load_fixture('empty_ratings_page.html'))
  end

  let(:document) { Rimdb::Document::Rating.new(123) }

  it 'returns the correct url' do
    expected_url = /.*\/user\/123\/ratings\?sort=ratings_date:desc&start=1/
    expect(document.url(1).to_s).to match expected_url
  end

  it 'should get page 1' do
    expect(document.get(1)).to be_an_instance_of Nokogiri::HTML::Document
  end

  describe 'empty' do
    it 'returns true when displaying no result' do
      document.get(300)
      expect(document.empty?).to equal true
    end

    it 'returns false with a valid result set' do
      document.get(1)
      expect(document.empty?).to equal false
    end
  end

end
