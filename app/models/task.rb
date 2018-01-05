#schema information
#table name:tasks
 
#Task_Name       :string  
#Due_Date        :date
#Note            :string
#created_at      :datetime,   null: false
#updated_at      :datetime,   null: false
#checked         :boolean



class Task < ApplicationRecord
  #確定task欄位內容不可為空白，due date一定要寫年/月/日
  validates_presence_of :task_name, :due_date

  #定義要刪除task的話必須要在duedate前才可以，超過後就不行
  def no_overdue
    #沒有過期的話，可以刪除
    !overdue
  end

  private
  
  def overdue
    due_date < Date.today
  end

end


