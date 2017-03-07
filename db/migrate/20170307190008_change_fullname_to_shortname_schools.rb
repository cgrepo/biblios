class ChangeFullnameToShortnameSchools < ActiveRecord::Migration
  def change
    rename_column :schools, :fullname, :shortname
  end
end
