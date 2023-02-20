# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid

  enum role: %i[admin staff customer]
end
