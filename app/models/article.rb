class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :votes
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true
  # scope :news, -> { where(category: 'news') }
  # scope :business, -> { where(category: 'business') }
  # scope :ent, -> { where(category: 'entertainment') }
  # scope :tech, -> { where(category: 'tech') }
  # scope :sports, -> { where(category: 'sports') }
  # scope :op, -> { where(category: 'opinion') }
end
