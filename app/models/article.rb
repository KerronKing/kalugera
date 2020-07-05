class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :votes
  is_impressionable
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true
end
