# frozen_string_literal: true

module MethodsHelper
  def response_data
    JSON.parse response.body, symbolize_names: true
  end
end
