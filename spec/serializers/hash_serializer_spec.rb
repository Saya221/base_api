# frozen_string_literal: true

require "rails_helper"

RSpec.describe HashSerializer do
  let(:hash) { { a: 1, b: 2 } }

  describe "#to_hash" do
    context "root eq true" do
      let(:result) { HashSerializer.new(hash, root: true).to_hash }

      it { expect(result).to eq({ data: hash }) }
    end

    context "root eq custom key" do
      let(:custom_sym) { HashSerializer.new(hash, root: :custom).to_hash }
      let(:custom_int) { HashSerializer.new(hash, root: 1).to_hash }
      let(:result) { { custom: hash } }

      it { expect(custom_sym).to eq result }
      it { expect(custom_int).to eq({ nil => hash }) }
    end

    context "dont have args root" do
      let(:result) { HashSerializer.new(hash).to_hash }

      it { expect(result).to eq hash }
    end
  end
end
