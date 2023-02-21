# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::Admin::UsersController do
  let(:response_data) { JSON.parse response.body, symbolize_names: true }
  let(:user) { create(:user) }

  describe "GET #show" do
    let(:params) { { id: id } }

    before { get :show, params: params }

    context "when get user's information successfully" do
      let(:id) { user.id }
      let(:expected_data) do
        {
          id: user.id,
          name: user.name,
          phone_number: user.phone_number,
          role: user.role
        }
      end

      it do
        expect(response_data[:success]).to eq true
        expect(response_data[:data][:user]).to eq expected_data
        expect(response_data).to have_key :meta
      end
    end

    context "when user is not found" do
      let(:id) { 0 }

      it do
        expect(response_data[:success]).to eq false
        expect(response_data[:errors][0][:resource]).to eq "user"
        expect(response_data[:errors][0][:feild]).to eq nil
        expect(response_data[:errors][0][:code]).to eq 1051
      end
    end
  end
end
