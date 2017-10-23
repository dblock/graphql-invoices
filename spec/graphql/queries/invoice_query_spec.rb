require 'rails_helper'

describe 'Invoice Query', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      query($id: Int!) {
        invoice(id: $id) {
          id
          fee_in_cents
        }
      }
    GRAPHQL
  end

  it 'returns an invoice' do
    response = client.execute(query, id: 42)
    invoice = response.data.invoice
    expect(invoice.id).to eq 42
    expect(invoice.fee_in_cents).to eq 20_000
  end
end
