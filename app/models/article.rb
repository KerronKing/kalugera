class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_one_attached :image
  has_many :votes
  is_impressionable
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true
end
