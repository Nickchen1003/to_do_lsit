class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :Name
      t.date :Deadline
      t.string :Created_by
      t.timestamps
    end
  end
end
