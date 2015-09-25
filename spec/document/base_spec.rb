require 'spec_helper'

describe 'Document Base' do

  let(:document) { Rimdb::Document::Base.new(123) }

  it 'initializes with a user_id' do
    expect(document.user_id).to eq 123
  end

  it 'expose the following methods' do
    expect(document.method(:get)).to be_a Method
    expect(document.method(:url)).to be_a Method
  end

  describe 'empty?' do
    it 'returns false for nil' do
      base = Rimdb::Document::Base.new(123)
      expect(base).to receive(:url).and_return 'http://foo.com'
      expect(base).to receive(:fetch).and_return 'foobar'
      base.get
      expect(base.html).to eq 'foobar'
    end
  end

end
