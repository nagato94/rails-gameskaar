class Order < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :comment, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
