# frozen_string_literal: true

module MethodsHelper
  def response_data
    JSON.parse response.body, symbolize_names: true
  end

  def convert_serialize(data)
    JSON.parse data.to_json, symbolize_names: true
  end

  def current_time
    @current_time ||= Time.current.to_i
  end
end
