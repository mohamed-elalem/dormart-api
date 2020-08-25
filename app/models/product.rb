class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :category
  has_many :reviews
  has_many :rates, through: :reviews

  def rate
    (rates.map(&:value).inject(0.0) { |sum, v| sum + v } / rates.count).round(2) || 0.0
  end
end
