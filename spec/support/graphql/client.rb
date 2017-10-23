RSpec.shared_context 'GraphQL Client', shared_context: :metadata do
  let(:client) do
    Graphlient::Client.new('https://api.example.org/graphql') do |client|
      client.http do |h|
        h.connection do |c|
          c.use Faraday::Adapter::Rack, app
        end
      end
    end
  end
end
