# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::SessionsController do
  let!(:user) { create :user, password: "this is password", email: "test@gmail.com" }

  describe "POST #login" do
    let(:params) { { user: { email: email, password: password } } }

    before { post :login, params: params}

    context "when login successfully" do
      let(:email) { "test@gmail.com" }
      let(:password) { "this is password" }

      it do
        expect(response_data[:success]).to eq true
        expect(response_data[:data][:token_info]).to have_key :access_token
        expect(response_data).to have_key :meta
      end
    end

    context "when user params missing" do
      let(:params) { {} }

      it do
        expect(response_data[:success]).to eq false
        expect(response_data[:errors][0][:code]).to eq 1200
      end
    end

    context "when email not found" do
      let(:email) { "tes@gmail.com" }
      let(:password) { "this is password" }

      it do
        expect(response_data[:success]).to eq false
        expect(response_data[:errors][0][:code]).to eq 1201
      end
    end

    context "when password not correct" do
      let(:email) { "test@gmail.com" }
      let(:password) { "this is not password" }

      it do
        expect(response_data[:success]).to eq false
        expect(response_data[:errors][0][:code]).to eq 1201
      end
    end
  end
end
