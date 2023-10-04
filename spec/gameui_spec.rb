require_relative '../lib/app'
RSpec.describe App do
  let(:app) { App.new }

  it 'should return author object' do
    mock = double('app')
    expect(mock).to receive(:author_data_feed) do
      { 'first_name' => 'jk', 'last_name' => 'rollin' }
    end
    author_obj = mock.author_data_feed
    expect(author_obj['first_name']).to eq('jk')
    expect(author_obj['last_name']).to eq('rollin')
  end

  it 'should validate string to false' do
    expect(app.check_string?('0011')).to eq(false)
  end

  it 'should validate string to true' do
    expect(app.check_string?('hello world')).to eq(true)
  end

  it 'should validate date to false' do
    expect(app.check_date?('20000-02-01')).to eq(false)
  end

  it 'should validate date to be true' do
    expect(app.check_date?('2000-02-01')).to eq(true)
  end

  it 'should compare two date [eval to false]' do
    expect(app.date_compare('2002-01-01', '2001-01-01')).to eq(false)
  end

  it 'should compare two date [eval to true]' do
    expect(app.date_compare('2001-01-01', '2002-01-01')).to eq(true)
  end
end
