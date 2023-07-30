class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    # user_id need not be checked as only authenticated user is allowed
    @tasks = Task.find_by(user_id: current_user.id)
    respond_to do |format|
      format.html {render 'index'}
      # if task is nil return empty json or proper articles response
      format.json {render json: @tasks.to_json}
    end
  end

  def show
    @task = Task.find_by(id: params[:id], user_id: current_user.id)
    respond_to do |format|
      format.html {render 'show'}
      format.json {render json: @task.to_json}
    end
  end

  def new
    @task = Task.new
  end

  def create
    # add authenticated user id here
    new_task_params=task_params
    new_task_params["user_id"] = current_user.id
    new_task_params.delete("due_date")
    @task = Task.new(new_task_params)

    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :due_date)
      # params.require(:task).extract!(:title, :description)
    end

    # def mapping
    #   :user
    # end
end

# <%= #current_user.email%>
  

