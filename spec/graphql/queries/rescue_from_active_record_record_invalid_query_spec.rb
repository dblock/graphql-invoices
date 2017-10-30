require 'rails_helper'

describe 'Rescue from ActiveRecord::RecordInvalid Query', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      query {
        rescueFromActiveRecordRecordInvalid {
          id
        }
      }
    GRAPHQL
  end

  it 'handles ActiveRecord::RecordInvalid and returns error' do
    expect do
      client.execute(query)
    end.to raise_error Graphlient::Errors::ExecutionError, "rescueFromActiveRecordRecordInvalid: Validation failed: Fee in cents can't be blank."
  end
end
