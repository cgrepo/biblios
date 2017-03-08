class ChangeScoolToSchoolSubscriptors < ActiveRecord::Migration
  def change
    rename_column :subscriptors, :scool_id, :school_id
    #remove_index :subscriptors,column: 'scool_id'
    #rename_index :subscriptors, :index_subscriptors_on_scool_id, :index_subscriptors_on_school_id
  end
end
