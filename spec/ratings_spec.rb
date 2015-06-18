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
    parser = Rimdb::Ratings.new(123)
    expect(parser.movies).to be_an_instance_of Array
    expect(parser.movies.first).to respond_to :title
  end

end
