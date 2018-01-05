class RenameTasksnameInTasks < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :Tasks_Name, :Task_Name
  end
end
