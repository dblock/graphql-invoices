require 'rails_helper'

describe 'Invalid Query', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      whatever {
      }
    GRAPHQL
  end

  it 'raises an execution error' do
    expect do
      client.execute(query)
    end.to raise_error GraphQL::ParseError, /Parse error on "whatever"/
  end
end
