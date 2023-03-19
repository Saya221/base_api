# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSession, type: :model do
  describe "relationships" do
    it { is_expected.to belong_to(:user) }
  end

  describe "methods" do
    context "#gen_uniq_session_token" do
      let!(:session) { create :user_session, session_token: "theuniqsessiontoken" }
      let(:dup_session) { build :user_session, session_token: "theuniqsessiontoken" }

      context "dup session token was changed" do
        before { dup_session.save }

        it { expect(dup_session.session_token).not_to eq "theuniqsessiontoken" }
      end
    end
  end
end
