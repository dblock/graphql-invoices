Query = GraphQL::ObjectType.define do
  name 'Query'

  field :invoice, InvoiceType do
    argument :id, !types.Int
    description 'Get an invoice by ID.'
    resolve ->(_obj, args, _ctx) {
      OpenStruct.new(
        id: args[:id],
        fee_in_cents: 20_000
      )
    }
  end
end
