class TasksController < ApplicationController
  before_action :authenticate_user!, unless: :allowed_access
  def index
    # user_id need not be checked as only authenticated user is allowed to see tasks
    @tasks = Task.where(user_id: current_user.id).all
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
    @task = Task.new(new_task_params)

    if @task.save
      respond_to do |format|
        format.html {redirect_to @task}
        format.json {render json: @task.to_json, status: :created}
      end
    else
      respond_to do |format|
        format.html {render :new, status: :unprocessable_entity}
        format.json {render json: {message: "you do not have access to perform this action"}, status: :unauthorized}
      end
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :due_date)
      # params.require(:task).extract!(:title, :description)
    end

    def allowed_access
      current_user
    end
end

# <%= #current_user.email%>
  

