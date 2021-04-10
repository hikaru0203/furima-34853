class Item < ApplicationRecord
  validates :price,             presence: true, numericality: { only_integer: true },  format: { with: /\A[0-9]+\z/ }
  validates_inclusion_of :price, in: 300..9999999
  validates :name,              presence: true, length: { maximum: 40 }
  validates :text,              presence: true, length: { maximum: 1000 }
  with_options numericality: { other_than: 0 } do
    validates :condition_id
    validates :prefecture_id
    validates :cost_id
    validates :ship_date_id
    validates :category_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :ship_date
  belongs_to_active_hash :cost
end

