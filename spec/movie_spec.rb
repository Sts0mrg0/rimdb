require 'spec_helper'

describe 'Movie value object' do

  let(:movie) {
    Rimdb::Movie.new({
      title: 'Foo',
      year: '2001',
      blurb: 'A movie about Foo (90 mins.)'
    })
  }

  it 'initializes with a hash containing a title' do
    expect(movie.title).to eq 'Foo'
  end

  it 'responds to the correct properties' do
    expect(movie).to respond_to :title
    expect(movie).to respond_to :year
    expect(movie).to respond_to :rating
    expect(movie).to respond_to :blurb
  end

  it 'initializes with a year' do
    expect(movie.year).to eq '2001'
  end

  it 'should default values to \'Unknown\' when unknown' do
    expect(Rimdb::Movie.new({ title: 'foo' }).year).to eq 'Unknown'
    expect(Rimdb::Movie.new({ title: 'moo' }).blurb).to eq 'Unknown'
  end

  it 'converts to a hash' do
    expect(movie.to_h).to be_an_instance_of Hash
    expect(movie.to_h[:title]).to eq 'Foo'
    expect(movie.to_h[:year]).to eq '2001'
  end

  it 'coverts to a string' do
    expect(movie.to_s).to include 'Foo'
  end

  it 'can be determined as a movie' do
    expect(movie.is_movie?).to eq true
  end

  it 'can be determined as a TV show' do
    other_movie = Rimdb::Movie.new({
      title: 'Moo',
      year: 2001,
      blurb: 'This one aint a movie (30 mins.)'
    })
    expect(other_movie.is_movie?).to eq false
  end

  describe 'compares based on title' do
    it 'when greater than' do
      other_movie = Rimdb::Movie.new({
        title: 'Fob',
        year: 2001,
        blurb: 'Another movie about foo'
      })
      expect(movie.<=> other_movie).to eq 1
    end

    it 'when less than' do
      other_movie = Rimdb::Movie.new({
        title: 'Foz',
        year: 2001,
        blurb: 'Yet another movie about foo'
      })
      expect(movie.<=> other_movie).to eq -1
    end
  end

end
