class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cities
  has_many :salons
  has_many :notes
  has_many :tasks
  has_many :sales_sessions
  has_many :sales_actions
end
