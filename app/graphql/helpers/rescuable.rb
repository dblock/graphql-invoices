class Rescuable
  attr_reader :resolve_func

  def initialize(resolve_func)
    @resolve_func = resolve_func
  end

  def call(obj, args, ctx)
    resolve_func.call(obj, args, ctx)
  rescue ActiveRecord::RecordNotFound
    nil
  rescue ActiveRecord::RecordInvalid => e
    error_messages = e.record.errors.full_messages.join("\n")
    GraphQL::ExecutionError.new "Validation failed: #{error_messages}."
  rescue StandardError => e
    GraphQL::ExecutionError.new e.message
  end
end
