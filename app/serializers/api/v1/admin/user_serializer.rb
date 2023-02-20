# frozen_string_literal: true

class Api::V1::Admin::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :name, :phone_number, :role, :age

  def attributes *attrs
    super.slice(*fields_custom[:users])
  end

  ROOT = {
    users: %i[id name phone_number role]
  }.freeze
end
