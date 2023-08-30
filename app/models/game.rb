class Game < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  CATEGORY = %w[FPS Moba RPG MMO MMORPG Ação Aventura Puzzle Esportes Estratégia Simulação Terror].freeze
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :user_id, presence: true
  validates :image, presence: true
end
