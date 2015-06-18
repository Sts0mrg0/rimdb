describe 'Movie value object' do

  it 'should initialize with a hash containing a title' do
    expect(Rimdb::Movie.new({ title: 'foo' }).title).to eq 'foo'
  end

  it 'should initialize with a year' do
    expect(Rimdb::Movie.new({ title: 'foo', year: '2001' }).year).to eq '2001'
  end

  it 'should default values to \'Unknown\' when unknown' do
    expect(Rimdb::Movie.new({ title: 'foo' }).year).to eq 'Unknown'
  end

end
