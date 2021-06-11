# frozen_string_literal: true

class Article < ApplicationRecord
  # include Visible
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :users, through: :likes
  validates :title, presence: true, length: { minimum: 5 }

  enum status: { active: 0, not_active: 1, archived: 2 }

  # def archived?
  # status == 'archived'
  # end
end
