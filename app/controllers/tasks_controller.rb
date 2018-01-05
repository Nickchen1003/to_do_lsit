class TasksController < ApplicationController
  before_action :set_task, :only => [:show, :update, :destroy]

  def index
    #宣告實例變數
    @tasks = Task.all
  end

  def new
    #首頁上的new task按鈕
    @task = Task.new
  end

  def create
    #編輯事項頁面的add new task按鈕
    #若填寫的待辦事項資料不完全(model裡的validates，:Task_Name, :Due_Date)則無法回儲存成功
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url
    else
      render :action => :new
    end
  end

  def show
    #已經用before action 的set_task取代
  end

  def update
    #儲存編輯後的待辦事項
    #已經用before action 的set_task取代
    #若填寫的待辦事項資料不完全(model裡的validates，:Task_Name, :Due_Date)則無法回儲存成功
    if @task.update_attributes(task_params)
      redirect_to tasks_url
    else 
      render :action => :show
    end
  end

  def destroy
    #刪除鍵
    #已經用before action 的set_task取代
    if @task.no_overdue
      #任務刪除，並跳出顯示幕，導回回任務頁面
      @task.destroy
      flash[:alert] = '任務已刪除'
      redirect_to tasks_url 

    else
      #告知警示，說任務無法刪除
      #導回任務頁面
      flash[:alert] = '這項任務已經過了Due Date，無法刪除了'
      redirect_to tasks_url 
    end
  end






   private
  def task_params
    #代辦事項的資料
    params.require(:task).permit(:task_name, :due_date, :note, :checked)
  end

  def set_task
    #用ste_task簡稱 Task.find(params[:id])，用在edit, update, destroy
    @task = Task.find(params[:id])
  end

end