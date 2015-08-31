require 'spec_helper'

describe 'Ratings' do

  before :each do
    page_1 = /.*\/ratings.*page=1.*/
    page_2 = /.*\/ratings.*page=2.*/

    stub_request(:get, page_1)
      .to_return(body: Utils.load_fixture('ratings_page.html'))
    stub_request(:get, page_2)
      .to_return(body: Utils.load_fixture('empty_ratings_page.html'))
  end

  it 'responds to Enumerator methods' do
    ratings = Rimdb::Ratings.new(123)
    ratings.fetch
    expect(ratings.each).to be_an_instance_of Enumerator
    expect(ratings).to respond_to :each
    expect(ratings).to respond_to :first
    expect(ratings.first).to be_an_instance_of Rimdb::Movie
  end

  it 'has a `movies()` method with access to the array' do
    ratings = Rimdb::Ratings.new(123)
    ratings.fetch
    expect(ratings.movies).to be_an_instance_of Array
    expect(ratings.movies.length).not_to be 0
  end

  it 'is a ratings of movies' do
    ratings = Rimdb::Ratings.new(123)
    ratings.fetch
    expect(ratings.to_a).to be_an_instance_of Array
    expect(ratings.first.title).to eq 'Untouchable'
  end

  it 'starts with the given movie' do
    ratings = Rimdb::Ratings.new(123)
    ratings.fetch
    first = ratings.first
    expect(first.title).to eq 'Untouchable'
    expect(first.year).to eq '2011'
    expect(first.rating).to eq 10
    expect(first.blurb).to include 'quadriplegic'
  end

  it 'should return the correct cover URL' do
    ratings = Rimdb::Ratings.new(123)
    ratings.fetch
    first = ratings.movies.first
    expect(first.cover).to start_with 'http://ia.media-imdb.com'
  end

  it 'should return whether it is a movie' do
    ratings = Rimdb::Ratings.new(123)
    ratings.fetch
    first = ratings.movies.first
    expect(first.is_movie?).to be true
  end

end
