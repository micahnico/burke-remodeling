class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

   def create
    @salon = Salon.find(params[:salon_id])
    @zip_code = ZipCode.find_by_id(@salon.zip_code_id)
    @city = City.find_by_id(@zip_code.city_id)
    @task = @salon.tasks.new(task_params)
    @task.user_id = current_user.id
    @task.due_at = Date.civil(params[:due_at][:year].to_i, params[:due_at][:month].to_i, params[:due_at][:day].to_i)

    respond_to do |format|
      if @task.save
        format.html { redirect_to edit_city_zip_code_salon_path(@city, @zip_code, @salon), notice: 'task Added' }
        format.js { render :layout => false }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
end

  
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'task was successfully destroyed.' }
      format.js { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :details, :text_alert, :due_at, :completed_at, :completed)
    end
end