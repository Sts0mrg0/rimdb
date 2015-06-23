describe 'Ratings' do

  before(:all) do
    @ratings_page = Utils.load_fixture('ratings_page.html')
  end

  before(:example) do
    document = Nokogiri::HTML(@ratings_page)
    allow(Rimdb::Document).to receive(:fetch).and_return document
  end

  it 'should fetch on initialization' do
    Rimdb::Ratings.new('12345')
    expect(Rimdb::Document).to have_received(:fetch)
  end

  it 'should respond to movies()' do
    ratings = Rimdb::Ratings.new(123)
    expect(ratings.movies).to be_an_instance_of Array
    expect(ratings.movies.first).to respond_to :title
    expect(ratings.movies.first).to respond_to :rating
  end

  it 'should display the correct information' do
    ratings = Rimdb::Ratings.new(123)
    first = ratings.movies.first
    expect(first.title).to eq 'Untouchable'
    expect(first.year).to eq '2011'
    expect(first.rating).to eq '10'
  end

end
