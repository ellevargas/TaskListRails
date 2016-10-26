class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update]
  # except instead of only uses it on all but the aforementioned methods

  def index
    @tasks = Task.all
    # @tasks = TasksController.alltasks
  end

  def new
    @path = "create"
    @mytask = Task.new
  end

  def create
    @params = params
    @mytask = Task.new
    @mytask.title = params[:task][:title]
    @mytask.description = params[:task][:description]
    @mytask.completed_at = params[:task][:completed_at]
    @mytask.completion_status = params[:task][:completion_status]
    if @mytask.title == nil ||  @mytask.title == ""
      flash[:notice] = "Dude you need a title at the very least"
      redirect_to action: 'new'
    else
      @mytask.save
      redirect_to action: 'index'

    end
  end

  def show; end

  def edit
    @mytask.save
    if @mytask == nil
      @mytask = {id: params[:id].to_i, title: "Dude that doesn't exist"}
    end
  end

  def update
    find_task
    if @mytask.update(task_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def complete
    find_task
    @mytask.marked_completed
    @mytask.save
    redirect_to action: 'index'
  end

  def destroy
    Task.destroy(params[:id].to_i)
    redirect_to action: 'index'
  end

  # puts statement in controller and model method to see if it worked
  # wrap saved in a conditional b/c it'll return true or false

private

  def task_params
    params.require(:task).permit(:title, :description)

  #etc? this is for update/create/new, SHOULD USE when passing a hash to any of those methods, do this to prevent injection risks

  end

  def find_task
    @mytask = Task.find(params[:id])
  end

end

#new files in views/tasks (base on edit or something)
