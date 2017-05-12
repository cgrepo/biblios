class CreateBlockeds < ActiveRecord::Migration
  def change
    create_table :blockeds do |t|
      t.references :subscriptor, index: true, foreign_key: true
      t.date :end
      t.text :notes

      t.timestamps null: false
    end
  end
end
