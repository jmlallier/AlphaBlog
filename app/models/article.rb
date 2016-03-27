class Article < ActiveRecord::Base
  has_many :article_categories
  has_many :categories, through: :article_categories
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 150 }
  validates :description, presence: true, length: { minimum: 15 }
  validates :user_id, presence: true

end