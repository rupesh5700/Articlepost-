# frozen_string_literal: true

class AddUserRefToArticle < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user, foreign_key: true
  end
end
