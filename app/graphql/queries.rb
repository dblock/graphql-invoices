Query = GraphQL::ObjectType.define do
  name 'Query'

  field :invoice, InvoiceType do
    argument :id, !types.Int
    description 'Get an invoice by ID.'
    resolve ->(_obj, args, _ctx) {
      Invoice.new(
        id: args[:id],
        fee_in_cents: 20_000
      )
    }
  end

  # returning a GraphQL::ExecutionError directly
  field :executionError, InvoiceType do
    resolve ->(_object, _args, _ctx) {
      GraphQL::ExecutionError.new('This has not been implemented yet.')
    }
  end

  # handling ActiveRecord and Standard errors
  field :rescueFromActiveRecordRecordNotFound, InvoiceType do
    argument :id, !types.Int
    resolve ->(_object, args, _ctx) {
      Invoice.where(id: args[:id]).first
    }
  end

  field :rescueFromActiveRecordRecordInvalid, InvoiceType do
    resolve ->(_object, _args, _ctx) {
      Invoice.create!
    }
  end

  field :rescueFromStandardError, InvoiceType do
    resolve ->(_object, _args, _ctx) {
      raise 'Something went wrong.'
    }
  end
end
