require 'adhd_gpt'

class TasksController < ApplicationController
  protect_from_forgery with: :null_session
 
  def index
    @tasks = Task.all
  end

  def create
    detailed_goals = AdhdGpt.get_task_list(params[:initial_goal])
    @task = Task.new(goal: params[:initial_goal], generated_tasks: detailed_goals)
    render json: @task.to_json(methods: :generated_tasks_html) if @task.save
  end
end
