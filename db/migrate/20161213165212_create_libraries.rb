class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address
      t.string :telephone

      t.timestamps null: false
    end
  end
end
