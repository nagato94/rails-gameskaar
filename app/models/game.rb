class Game < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
end
