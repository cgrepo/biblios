class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :copy
      t.integer :volumen
      t.integer :tome
      t.integer :accessible
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
