class RenameTitle < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :Deadline, :Due_Date
    rename_column :tasks, :Created_by, :Note
  end
end
