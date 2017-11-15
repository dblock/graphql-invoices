class GraphqlController < ApplicationController
  def execute
    result = Schema.execute(
      query,
      variables: variables,
      context: context,
      operation_name: operation_name
    )
    render json: result
  end

  private

  def query
    params[:query]
  end

  def operation_name
    params[:operationName]
  end

  def context
    {}
  end

  def variables
    params[:variables] || {}
  end
end
