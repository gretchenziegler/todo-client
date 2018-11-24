RSpec.describe Todo::Client::Lists do

  context 'Retrieving all lists' do
    subject { described_class.all(params) }
    let(:params){{}}

    context 'given a successful request' do
      it 'returns all available lists' do
      end
    end

    context 'given an unsuccessful request' do
      it 'raises an error' do
      end
    end
  end

  context 'Creating a list' do
    context 'when a list name is specified' do
      it 'creates the list' do
      end
    end

    context 'without a given list name' do
      it 'raises an error' do
      end
    end
  end
  
end
