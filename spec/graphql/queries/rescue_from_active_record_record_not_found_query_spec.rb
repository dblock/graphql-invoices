require 'rails_helper'

describe 'Rescue from ActiveRecord::RecordNotFound Query', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      query($id: Int!) {
        rescueFromActiveRecordRecordNotFound(id: $id) {
          id
        }
      }
    GRAPHQL
  end

  it 'handles ActiveRecord::RecordNotFound and returns nil' do
    result = client.execute(query, id: 42)
    expect(result.data.rescue_from_active_record_record_not_found).to be nil
  end
end
