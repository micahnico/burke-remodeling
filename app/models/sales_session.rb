class SalesSession < ActiveRecord::Base
	belongs_to :user
	has_many :sales_actions
end
