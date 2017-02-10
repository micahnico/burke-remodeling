class Salon < ActiveRecord::Base
	belongs_to :zip_code
	belongs_to :user
	has_many :notes	
	has_many :tasks
end
