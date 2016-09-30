class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # @tasks = TasksController.alltasks
  end

  def new
    @mytask = Task.new
  end

  def create
    @params = params
    @mytask = Task.new
    @mytask.title = params[:task][:title]
    @mytask.description = params[:task][:description]
    @mytask.completed_at = params[:task][:completed_at]
    @mytask.completion_status = params[:task][:completion_status]
    @mytask.save
    redirect_to action: 'index'
  end

  def show
    @mytask = Task.find(params[:id].to_i)
  end

  def edit
  end

  def update
    @mytask = Task.find(params[:id].to_i)
    @mytask.marked_completed
    @mytask.save

    # puts @mytask.completion_status
    # puts @mytask.completed_at
    # if @mytask.save == true
    #   puts @mytask.completion_status
    #   puts @mytask.completed_at
    # else
    #   puts false
    # end
    # puts "wheee"
    redirect_to action: 'index'
  end

  def destroy
    Task.destroy(params[:id].to_i)
    redirect_to action: 'index'
  end

  # puts statement in controller and model method to see if it worked
  # wrap saved in a conditional b/c it'll return true or false

  # def self.alltasks
  #   [
  #     {id: 1, title: "Do photo shoot", description: "Fresh and profesh for my Linkedin", completed_at: Time.now, completion_status: false},
  #     {id: 2, title: "Feed my face", description: "I am so damn hungry", completed_at: Time.now, completion_status: false},
  #     {id: 3, title: "Play board games", description: "As long as it's not Catan again", completed_at: Time.now, completion_status: false}
  #   ]
  # end

end

#new files in views/tasks (base on edit or something)
