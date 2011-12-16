class MyTasksController < ApplicationController
  respond_to :html, :json,:js
  before_filter :authenticate_user!
  before_filter :get_my_task
  # GET /my_tasks
  # GET /my_tasks.json
  def index
    @my_tasks = @my_task.accepted
    @acceptables = @my_task.acceptables

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_tasks }
    end
  end

  # GET /my_tasks/1
  # GET /my_tasks/1.json
  def show
    @my_task = MyTask.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_task }
    end
  end

  # GET /my_tasks/new
  # GET /my_tasks/new.json
  #def new
    #@my_task = MyTask.new

    #respond_to do |format|
      #format.html # new.html.erb
      #format.json { render json: @my_task }
    #end
  #end

  # GET /my_tasks/1/edit
  #def edit
    #@my_task = MyTask.find(params[:id])
  #end

  # POST /my_tasks
  # POST /my_tasks.json
  def create
    @id = params[:task_id]
    @task = @my_task.accept @id

    respond_to do |format|
      if @task.nil?
        @error = "task already taken"
        format.js { render 'fault' }
        format.json { render json: "has taken", status: :unprocessable_entity }
      else
        format.js
        format.json { render json: @task, status: :created}#, location: @rs }
      end
    end
  end

  # 完成
  def update
    @id = params[:id]
    @task = @my_task.finish @id

    respond_to do |format|
      if @task
        #format.html { redirect_to @my_task, notice: 'My task was successfully updated.' }
        format.js
        format.json { head :ok }
      else
        @error = 'cannot finish'
        #format.html { render action: "edit" }
        format.js{ render 'fault'}
        format.json { render json: @my_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_tasks/1
  # DELETE /my_tasks/1.json
  def destroy
    @id = params[:id]
    @task = @my_task.give_up @id

    respond_to do |format|
      if @task
        format.js
        format.json { head :ok }
      end
    end
  end

  private
  def get_my_task
    @my_task = MyTasks.new :user => current_user
  end
end
