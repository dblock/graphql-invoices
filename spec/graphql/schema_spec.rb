require 'rails_helper'

describe 'GraphQL Schema', type: 'request' do
  include_context 'GraphQL Client'

  it 'retrieves schema' do
    expect(client.schema).to be_a GraphQL::Schema
  end
end
