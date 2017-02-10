class SalesAction < ActiveRecord::Base
  belongs_to :user
  belongs_to :salon
  belongs_to :sales_session
end
