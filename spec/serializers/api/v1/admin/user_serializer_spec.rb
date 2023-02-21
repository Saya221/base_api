# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::Admin::UserSerializer do
  let(:user) { create(:user, id: 1, name: "abc", phone_number: "0123456789", role: "admin") }

  describe "serialize type is root" do
    let(:response_data) { described_class.new(user, type: :root).as_json }
    let(:expected_data) do
      {
        id: 1,
        name: "abc",
        phone_number: "0123456789",
        role: "admin"
      }
    end

    it { expect(response_data).to eq expected_data }
  end
end
