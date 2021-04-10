class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,      foreign_key: true
      t.string :price,         null: false
      t.string :condition_id,  null: false
      t.string :name,          null: false
      t.string :prefecture_id, null: false
      t.string :cost_id,       null: false
      t.string :ship_date_id,  null: false
      t.string :text,          null: false
      t.string :category_id,   null: false
      t.timestamps
    end
  end
end
