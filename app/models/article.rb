class Article < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :votes
  has_and_belongs_to_many :categories
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true
  default_scope -> { order(created_at: :desc) }
end
