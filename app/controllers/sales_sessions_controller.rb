class SalesSessionsController < ApplicationController
	before_action :authenticate_user!

	def new
		@sales_session = SalesSession.new
	end

	def create
		@sales_session = SalesSession.new(sales_sessions_params)
		@sales_session.user_id = current_user.id 

		respond_to do |format|
	      if @sales_session.save
	      	if @sales_session.walking == true
	        	format.html { redirect_to new_sales_session_sales_action_path(@sales_session), notice: "Let's Make Sales!" }
	    	else
	    		format.html { redirect_to cities_my_cities_path, notice: "Let's Make Some Calls!" }
	    	end
	        format.json { render :show, status: :created, location: @sales_session }
	      else
	        format.html { render :new }
	        format.json { render json: @sales_session.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private
	def set_sales_session
		@sales_session = SalesSession.find(params[:id])
	end
	def sales_sessions_params
      params.require(:sales_session).permit(:walking, :start_location)
    end
end