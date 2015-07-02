require 'spec_helper'

describe 'Ratings' do

  before(:each) do
    stub_request(:get, 'http://www.imdb.com/user/123/ratings')
      .to_return(body: Utils.load_fixture('ratings_page.html'))
  end

  it 'should respond to movies()' do
    ratings = Rimdb::Ratings.new(123)
    expect(ratings.movies).to be_an_instance_of Array
    expect(ratings.movies.first).to be_an_instance_of Rimdb::Movie
  end

  it 'should respond to each_movie()' do
    ratings = Rimdb::Ratings.new(123)
    expect(ratings.each_movie).to be_an_instance_of Enumerator
  end

  it 'should display the correct information' do
    ratings = Rimdb::Ratings.new(123)
    first = ratings.movies.first
    expect(first.title).to eq 'Untouchable'
    expect(first.year).to eq '2011'
    expect(first.rating).to eq '10'
    expect(first.blurb).to include 'quadriplegic'
  end

  it 'should return the correct cover URL' do
    ratings = Rimdb::Ratings.new(123)
    first = ratings.movies.first
    expect(first.cover).to start_with 'http://ia.media-imdb.com'
  end

  it 'should return whether it is a movie' do
    ratings = Rimdb::Ratings.new(123)
    first = ratings.movies.first
    expect(first.is_movie?).to be true
  end

end
