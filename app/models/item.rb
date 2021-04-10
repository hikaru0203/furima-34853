class Item < ApplicationRecord
  
  validates :price,             presence: true
  validates :condition_id,      numericality: { other_than: 0 }
  validates :name,              presence: true, length: { maximum: 40 }
  validates :prefecture_id,     numericality: { other_than: 0 }
  validates :cost_id,           numericality: { other_than: 0 }
  validates :ship_date_id,      numericality: { other_than: 0 }
  validates :text,              presence: true, length: { maximum: 1000 }
  validates :category_id,       numericality: { other_than: 0 }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :ship_date
  belongs_to_active_hash :cost
end

