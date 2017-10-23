require 'rails_helper'

describe 'Create Invoice Mutation', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      mutation($input: createInvoiceInput!) {
        createInvoice(input: $input) {
          id
          fee_in_cents
        }
      }
    GRAPHQL
  end

  it 'returns an invoice' do
    response = client.execute(query, input: { fee_in_cents: 42_000 })
    invoice = response.data.create_invoice
    expect(invoice.id).to eq 1231
    expect(invoice.fee_in_cents).to eq 42_000
  end
end
