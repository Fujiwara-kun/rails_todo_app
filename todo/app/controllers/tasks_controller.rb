class TasksController < ApplicationController
    def index
        @tasks=Task.order(created_at: :desc)
    end
    def new
        @task=Task.new
    end
    def create
        @task=Task.new(task_params)
        if @task.save
            redirect_to tasks_path, notice: "タスクを作成しました"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :done)
    end
end
