class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :description
      t.integer :books
      t.float :penalty
      t.integer :returnDay
      t.integer :renovation
      t.date :vigencyStar
      t.date :vigencyEnd
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
