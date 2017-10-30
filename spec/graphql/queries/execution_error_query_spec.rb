require 'rails_helper'

describe 'Execution Error Query', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      query {
        executionError {
          id
        }
      }
    GRAPHQL
  end

  it 'raises an execution error' do
    expect do
      client.execute(query)
    end.to raise_error Graphlient::Errors::ExecutionError, 'executionError: This has not been implemented yet.'
  end
end
