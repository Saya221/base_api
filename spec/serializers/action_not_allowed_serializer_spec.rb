# frozen_string_literal: true

require "rails_helper"

RSpec.describe ActionNotAllowedSerializer do
  let(:error) { ActionController::MethodNotAllowed.new }
  let(:result) { ActionNotAllowedSerializer.new(error).serialize }

  describe "#serialize" do
    it do
      expect(result[:success]).to eq false
      expect(result[:errors][0][:code]).to eq 1202
    end
  end
end
