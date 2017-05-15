class CreateBorroweds < ActiveRecord::Migration
  def change
    create_table :borroweds do |t|
      t.references :book, index: true, foreign_key: true
      t.references :subscriptor, index: true, foreign_key: true
      t.date :outDate
      t.date :returnDate

      t.timestamps null: false
    end
  end
end
