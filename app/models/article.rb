class Article < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 100_000 }

  has_many :comments
end
