class City < ActiveRecord::Base
	has_many :zip_codes
	belongs_to :user
end
