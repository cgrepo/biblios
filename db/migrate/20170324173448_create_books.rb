class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :autor
      t.string :classification
      t.integer :published
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
