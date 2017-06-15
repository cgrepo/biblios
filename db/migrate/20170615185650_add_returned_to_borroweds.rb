class AddReturnedToBorroweds < ActiveRecord::Migration
  def change
    add_column :borroweds, :returned, :boolean
  end
end
