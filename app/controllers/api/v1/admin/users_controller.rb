# frozen_string_literal: true

class Api::V1::Admin::UsersController < Api::V1::BaseController
  def show
    user = User.find params[:id]

    render_json user, serializer: Api::V1::Admin::UserSerializer
  end
end
