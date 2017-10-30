require_relative 'types'
require_relative 'helpers'
require_relative 'queries'
require_relative 'mutations'

Schema = GraphQL::Schema.define do
  query Query
  mutation Mutation
end
