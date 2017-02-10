class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

   def create
    @salon = Salon.find(params[:salon_id])
    @zip_code = ZipCode.find_by_id(@salon.zip_code_id)
    @city = City.find_by_id(@zip_code.city_id)
    @note = @salon.notes.new(note_params)
    @note.user_id = current_user.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to edit_city_zip_code_salon_path(@city, @zip_code, @salon), notice: 'Note Added' }
        format.js { render :layout => false }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
end

  
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Note was successfully destroyed.' }
      format.js { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:salon_id, :body)
    end
end
