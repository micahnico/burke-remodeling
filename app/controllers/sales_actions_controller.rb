class SalesActionsController < ApplicationController
	before_action :load_session
	before_action :set_sales_action, except: [:new, :create]
	before_action :authenticate_user!

	def new
		@sales_action = @sales_session.sales_actions.new
		@salon = next_salon
	end

	def create
		@sales_action = @sales_salon.salesactions.new
		@sales_action.user_id = current_user.id
		@sales_action.salon_id = @salon.id 

		respond_to do |format|
	      if @sales_action.save
	        format.html { redirect_to new_sales_session_sales_action(@sales_session) }
	        format.json { render :show, status: :created, location: @sales_action }
	      else
	        format.html { render :new }
	        format.json { render json: @sales_action.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private
	def set_sales_action
		@sales_action = SalesAction.find(params[:id])
	end

	def load_session
		@sales_session = SalesSession.find(params[:sales_session_id])
	end


	def next_salon
		@salon = Salon.find_by_id(1)
	end
end