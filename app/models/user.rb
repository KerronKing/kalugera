class User < ApplicationRecord
  has_many :articles
  has_many :votes
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 40 }
end
