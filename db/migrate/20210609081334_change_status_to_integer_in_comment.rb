# frozen_string_literal: true

class ChangeStatusToIntegerInComment < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :status, :integer, default: 0
  end
end
