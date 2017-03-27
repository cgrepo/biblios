class AddTokenToBooks < ActiveRecord::Migration
  def change
    add_column :books, :token, :integer
  end
end
