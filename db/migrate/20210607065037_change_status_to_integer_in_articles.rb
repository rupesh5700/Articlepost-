# frozen_string_literal: true

class ChangeStatusToIntegerInArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :status, :integer, default: 0
  end
end
