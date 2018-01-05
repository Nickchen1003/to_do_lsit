class RenameNameInTasks < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :Name, :Tasks_Name 
  end
end
