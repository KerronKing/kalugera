class Article < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :image
  has_many :votes
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true
  default_scope -> { order(created_at: :desc) }
end
