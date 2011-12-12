class MyTasksController < ApplicationController
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
    @my_task = MyTask.find(params[:id])

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
    @rs = @my_task.accept(:task_id => params[:task_id])

    respond_to do |format|
      if @rs.nil?
        #format.html { render action: "new" }
        format.json { render json: "has taken", status: :unprocessable_entity }
      else
        #format.html { redirect_to @my_task, notice: 'My task was successfully created.' }
        format.json { render json: @rs, status: :created}#, location: @rs }
      end
    end
  end

  # PUT /my_tasks/1
  # PUT /my_tasks/1.json
  #def update
    #@my_task = MyTask.find(params[:id])

    #respond_to do |format|
      #if @my_task.update_attributes(params[:my_task])
        #format.html { redirect_to @my_task, notice: 'My task was successfully updated.' }
        #format.json { head :ok }
      #else
        #format.html { render action: "edit" }
        #format.json { render json: @my_task.errors, status: :unprocessable_entity }
      #end
    #end
  #end

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

  private
  def get_my_task
    @my_task = MyTasks.new :user => current_user
  end
end
