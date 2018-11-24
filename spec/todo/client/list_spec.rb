RSpec.describe Todo::Client::List do

  context 'Retrieving a single list' do
    subject { described_class.find(params) }

    context 'given a successful request' do
      it 'returns the specified list' do
      end
    end

    context 'given an unsuccessful request' do
      it 'throws an error' do
      end
    end
  end

  context 'Updating a list' do
    subject { described_class.update(params) }

    context 'given a valid list_id' do
      it 'updates the list' do
      end
    end

    context 'when list_id is missing or invalid' do
      it 'throws an error' do
      end
    end
  end

  context 'Deleting a list' do
    subject { described_class.delete(params) }

    context 'given a valid list_id' do
      it 'deletes the list' do
      end
    end

    context 'when list_id is missing or invalid' do
      it 'throws an error' do
      end
    end
  end
  
end
