# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  # has_and_belongs_to_many :articles
  has_many :likes
  has_many :articles, through: :likes
end
