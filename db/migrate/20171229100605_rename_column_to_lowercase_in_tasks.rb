class RenameColumnToLowercaseInTasks < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :Task_Name, :task_name
    rename_column :tasks, :Due_Date, :due_date
    rename_column :tasks, :Note, :note
  end
end
