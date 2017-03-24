class CreateBookProfiles < ActiveRecord::Migration
  def change
    create_table :book_profiles do |t|
      t.integer :published
      t.string :isbn
      t.string :title
      t.string :autor
      t.string :classification
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
