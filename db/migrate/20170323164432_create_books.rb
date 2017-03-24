class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.date :entryDate
      t.integer :copy
      t.integer :volumn
      t.integer :tome
      t.integer :accessible
      t.integer :profile
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
