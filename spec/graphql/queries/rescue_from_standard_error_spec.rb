require 'rails_helper'

describe 'Rescue from StandardError', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      query {
        rescueFromStandardError {
          id
        }
      }
    GRAPHQL
  end

  it 'handles StandardError and returns error' do
    expect do
      client.execute(query)
    end.to raise_error Graphlient::Errors::ExecutionError, 'rescueFromStandardError: Something went wrong.'
  end
end
