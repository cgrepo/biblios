class CreateResponsables < ActiveRecord::Migration
  def change
    create_table :responsables do |t|
      t.string :fullname
      t.string :email
      t.string :telephone
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
