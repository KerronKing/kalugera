# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :articles
  has_many :votes
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 40 }
end
