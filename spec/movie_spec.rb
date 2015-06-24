require 'spec_helper'

describe 'Movie value object' do

  it 'should initialize with a hash containing a title' do
    expect(Rimdb::Movie.new({ title: 'foo' }).title).to eq 'foo'
  end

  it 'should respond to the correct properties' do
    movie = Rimdb::Movie.new({
      title: 'Foo',
      year: '2001',
      blurb: 'A movie about Foo'
    })
    expect(movie).to respond_to :title
    expect(movie).to respond_to :year
    expect(movie).to respond_to :rating
    expect(movie).to respond_to :blurb
  end

  it 'should initialize with a year' do
    expect(Rimdb::Movie.new({ title: 'foo', year: '2001' }).year).to eq '2001'
  end

  it 'should default values to \'Unknown\' when unknown' do
    expect(Rimdb::Movie.new({ title: 'foo' }).year).to eq 'Unknown'
    expect(Rimdb::Movie.new({ title: 'moo' }).blurb).to eq 'Unknown'
  end

end
