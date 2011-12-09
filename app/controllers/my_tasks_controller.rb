class MyTasksController < ApplicationController
  before_filter :authenticate_user!
  # GET /my_tasks
  # GET /my_tasks.json
  def index
    @obj_my_tasks = MyTasks.new :user => current_user
    @my_tasks = @obj_my_tasks.accepted
    @acceptables = @obj_my_tasks.acceptables

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_tasks }
    end
  end

  # GET /my_tasks/1
  # GET /my_tasks/1.json
  def show
    @my_task = MyTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_task }
    end
  end

  # GET /my_tasks/new
  # GET /my_tasks/new.json
  def new
    @my_task = MyTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_task }
    end
  end

  # GET /my_tasks/1/edit
  def edit
    @my_task = MyTask.find(params[:id])
  end

  # POST /my_tasks
  # POST /my_tasks.json
  def create
    @my_task = current_user.user_tasks.create(:task_id => params[:task_id])

    respond_to do |format|
      if @my_task.save
        format.html { redirect_to @my_task, notice: 'My task was successfully created.' }
        format.json { render json: @my_task, status: :created, location: @my_task }
      else
        format.html { render action: "new" }
        format.json { render json: @my_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_tasks/1
  # PUT /my_tasks/1.json
  def update
    @my_task = MyTask.find(params[:id])

    respond_to do |format|
      if @my_task.update_attributes(params[:my_task])
        format.html { redirect_to @my_task, notice: 'My task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_tasks/1
  # DELETE /my_tasks/1.json
  def destroy
    @my_task = MyTask.find(params[:id])
    @my_task.destroy

    respond_to do |format|
      format.html { redirect_to my_tasks_url }
      format.json { head :ok }
    end
  end
end
