class ChangePictureFromBinaryToString < ActiveRecord::Migration
  def change
    change_column :subscriptors, :picture, :string
  end
end
