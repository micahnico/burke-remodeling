class SalonsController < ApplicationController
  before_action :set_salon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :load_city
  before_action :load_zip_code

  # GET /salons
  # GET /salons.json
  def index
    @salons = @zip_code.salons.all
    @salons = @salons
  end

  # GET /salons/1
  # GET /salons/1.json
  def show
  end

  # GET /salons/new
  def new
    @salon = @zip_code.salons.new
  end

  # GET /salons/1/edit
  def edit
  end

  # POST /salons
  # POST /salons.json
  def create
    @salon = @zip_code.salons.new(salon_params)
    @salon.user_id = current_user.id

    respond_to do |format|
      if @salon.save
        format.html { redirect_to [@city, @zip_code, @salon], notice: 'Salon was successfully created.' }
        format.json { render :show, status: :created, location: @salon }
      else
        format.html { render :new }
        format.json { render json: @salon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salons/1
  # PATCH/PUT /salons/1.json
  def update
    respond_to do |format|
      if @salon.update(salon_params)
        format.html { redirect_to [@city, @zip_code, @salon], notice: 'Salon was successfully updated.' }
        format.json { render :show, status: :ok, location: @salon }
      else
        format.html { render :edit }
        format.json { render json: @salon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salons/1
  # DELETE /salons/1.json
  def destroy
    @salon.destroy
    respond_to do |format|
      format.html { redirect_to city_zip_code_salons_path(@city, @zip_code), notice: 'Salon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salon
      @salon = Salon.find(params[:id])
    end

    def load_zip_code
      @zip_code = ZipCode.find(params[:zip_code_id])
    end

    def load_city
      @city = City.find(params[:city_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salon_params
      params.require(:salon).permit(:business_name, :time_zone, :email, :street_address, :phone, :stage, :zip_code_id, :website, :web_address, :contact, :mobile_ready, :appointment_scheduling)
    end
end
