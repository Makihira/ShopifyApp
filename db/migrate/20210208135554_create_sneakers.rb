class CreateSneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :sneakers do |t|
      t.text :name
      t.text :maker
      t.text :color
      t.integer :price
      t.text :memo

      t.timestamps
    end
  end
end
