class CreateSubscriptors < ActiveRecord::Migration
  def change
    create_table :subscriptors do |t|
      t.string :account
      t.string :fullname
      t.references :group, index: true, foreign_key: true
      t.references :scool, index: true, foreign_key: true
      t.string :email
      t.string :address
      t.string :colony
      t.string :city
      t.string :state
      t.string :cp
      t.string :telephone
      t.string :celular
      t.binary :picture
      t.text :notes
      t.date :vigencyStart
      t.date :vigencyEnd
      t.integer :age
      t.text :gurantor

      t.timestamps null: false
    end
  end
end
