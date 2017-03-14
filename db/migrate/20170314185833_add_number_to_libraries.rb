class AddNumberToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :number, :integer
  end
end
