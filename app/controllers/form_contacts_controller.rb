class FormContactsController < ApplicationController
  before_action :set_form_contact, only: [:show, :edit, :update, :destroy]
  invisible_captcha only: [:create, :update], honeypot: :physical_address

  # GET /form_contacts
  # GET /form_contacts.json
  def index
    @form_contacts = FormContact.all
  end

  # GET /form_contacts/1
  # GET /form_contacts/1.json
  def show
  end

  # GET /form_contacts/new
  def new
    @form_contact = FormContact.new
  end

  # GET /form_contacts/1/edit
  def edit
  end

  # POST /form_contacts
  # POST /form_contacts.json
  def create
    @form_contact = FormContact.new(form_contact_params)

    respond_to do |format|
      if @form_contact.save
        AdminMailer.message_alert(@form_contact).deliver
        format.html { redirect_to root_path, notice: 'Thank You!  We will follow up shortly.' }
        format.json { render :show, status: :created, location: @form_contact }
      else
        format.html { render :new }
        format.json { render json: @form_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_contacts/1
  # PATCH/PUT /form_contacts/1.json
  def update
    respond_to do |format|
      if @form_contact.update(form_contact_params)
        format.html { redirect_to @form_contact, notice: 'Form contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_contact }
      else
        format.html { render :edit }
        format.json { render json: @form_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_contacts/1
  # DELETE /form_contacts/1.json
  def destroy
    @form_contact.destroy
    respond_to do |format|
      format.html { redirect_to form_contacts_url, notice: 'Form contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_contact
      @form_contact = FormContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_contact_params
      params.require(:form_contact).permit(:name, :email, :phone, :zip_code, :message)
    end
end
