class Game < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category, presence: true
end
