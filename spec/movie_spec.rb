require 'spec_helper'

describe 'Movie value object' do

  let(:movie) {
    Rimdb::Movie.new({
      title: 'Foo',
      year: '2001',
      blurb: 'A movie about Foo'
    })
  }

  it 'should initialize with a hash containing a title' do
    expect(movie.title).to eq 'Foo'
  end

  it 'should respond to the correct properties' do
    expect(movie).to respond_to :title
    expect(movie).to respond_to :year
    expect(movie).to respond_to :rating
    expect(movie).to respond_to :blurb
  end

  it 'should initialize with a year' do
    expect(movie.year).to eq '2001'
  end

  it 'should default values to \'Unknown\' when unknown' do
    expect(Rimdb::Movie.new({ title: 'foo' }).year).to eq 'Unknown'
    expect(Rimdb::Movie.new({ title: 'moo' }).blurb).to eq 'Unknown'
  end

  it 'should convert to a hash' do
    expect(movie.to_h).to be_an_instance_of Hash
    expect(movie.to_h[:title]).to eq 'Foo'
    expect(movie.to_h[:year]).to eq '2001'
  end

end
