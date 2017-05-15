class CreateReserveds < ActiveRecord::Migration
  def change
    create_table :reserveds do |t|
      t.references :book, index: true, foreign_key: true
      t.date :startDate
      t.date :finishDate
      t.references :subscriptor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
