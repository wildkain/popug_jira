# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  private

  def find_task
    @task = Task.with_pk(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
