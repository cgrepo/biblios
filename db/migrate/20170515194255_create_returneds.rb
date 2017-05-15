class CreateReturneds < ActiveRecord::Migration
  def change
    create_table :returneds do |t|
      t.references :book, index: true, foreign_key: true
      t.date :in

      t.timestamps null: false
    end
  end
end
