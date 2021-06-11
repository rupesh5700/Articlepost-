# frozen_string_literal: true

class Comment < ApplicationRecord
  # include Visible
  belongs_to :article
  enum status: { active: 0, not_active: 1, archived: 2 }
end
