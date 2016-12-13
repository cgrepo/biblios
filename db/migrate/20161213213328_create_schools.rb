class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :fullname
      t.string :responsable
      t.string :email
      t.string :telephone
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
