require_relative 'types'
require_relative 'queries'
require_relative 'mutations'

Schema = GraphQL::Schema.define do
  query Query
  mutation Mutation
end

GraphQL::Errors.configure(Schema) do
  rescue_from ActiveRecord::RecordNotFound do
    nil
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    error_messages = e.record.errors.full_messages.join("\n")
    GraphQL::ExecutionError.new "Validation failed: #{error_messages}."
  end

  rescue_from StandardError do |e|
    GraphQL::ExecutionError.new e.message
  end
end
